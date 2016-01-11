class VodNginxModule < Formula
  desc "drm on the fly for video on demand"
  homepage "https://github.com/kaltura/nginx-vod-module"
  url "https://github.com/kaltura/nginx-vod-module/archive/1.4.tar.gz"
  sha256 "98c560ec0159bd54485aa6c1ef399776e3c19bc6780dc1035a3317ad2498d531"

  bottle :unneeded

  patch :DATA

  def install
    (share+"vod-nginx-module").install Dir["*"]
  end
end

__END__
diff --git a/.travis.yml b/.travis.yml
index 53a71ec..91ea8e0 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -1,12 +1,12 @@
 before_install:
     - sudo apt-get update -qq
     - sudo apt-get install -y libssl-dev libpcre3-dev wget unzip libopencore-amrwb0 libopencore-amrnb0 libfaac0 libass4 libgsm1 libmp3lame0 libopenjpeg2 libschroedinger-1.0-0 libspeex1 libtheora0  libva1  libvpx1 libxvidcore4
-    - sudo wget http://installrepo.kaltura.org/releases/kaltura-ffmpeg2.1.3_amd64.deb 
+    - sudo wget http://installrepo.origin.kaltura.org/repo/releases/kaltura-ffmpeg_amd64.deb
     - sudo wget http://installrepo.kaltura.org/releases/kaltura-ffmpeg-deb-deps/libx264-123_0.123.2189+git35cf912-1_amd64.deb
     - sudo dpkg -i libx264-123_0.123.2189+git35cf912-1_amd64.deb
     - sudo wget http://installrepo.kaltura.org/releases/kaltura-ffmpeg-deb-deps/libfdk-aac0_0.1.3-1_amd64.deb
     - sudo dpkg -i libfdk-aac0_0.1.3-1_amd64.deb
-    - sudo dpkg -i kaltura-ffmpeg2.1.3_amd64.deb
+    - sudo dpkg -i kaltura-ffmpeg_amd64.deb
 language: c
 compiler:
     - clang
diff --git a/vod/filters/audio_filter.c b/vod/filters/audio_filter.c
index 20924d4..000deb1 100644
--- a/vod/filters/audio_filter.c
+++ b/vod/filters/audio_filter.c
@@ -869,6 +869,7 @@ audio_filter_update_track(audio_filter_state_t* state)
 	uint32_t old_timescale;
 	vod_status_t rc;
 	u_char* new_extra_data;
+	bool_t has_frames;
 
 	if (state->sink.encoder->time_base.num != 1)
 	{
@@ -881,20 +882,40 @@ audio_filter_update_track(audio_filter_state_t* state)
 	// decrement the old frame count and size
 	state->sequence->total_frame_count -= output->frame_count;
 	state->sequence->total_frame_size -= output->total_frames_size;
+	output->total_frames_size = 0;
+	output->total_frames_duration = 0;
 
 	// update frames
 	output->first_frame = state->frames_array.elts;
 	output->frame_count = state->frames_array.nelts;
 	output->last_frame = output->first_frame + output->frame_count;
 	output->frame_offsets = state->frame_offsets_array.elts;
+
+	// check whether there are any frames with duration
+	has_frames = FALSE;
+	last_frame = output->last_frame;
+	for (cur_frame = output->first_frame; cur_frame < last_frame; cur_frame++)
+	{
+		if (cur_frame->duration != 0)
+		{
+			has_frames = TRUE;
+			break;
+		}
+	}
+
+	if (!has_frames)
+	{
+		output->first_frame = NULL;
+		output->last_frame = NULL;
+		output->frame_count = 0;
+		output->frame_offsets = NULL;
+		return VOD_OK;
+	}
 	
 	// calculate the total frames size and duration
-	output->total_frames_size = 0;
-	output->total_frames_duration = 0;
 	output->media_info.min_frame_duration = 0;
 	output->media_info.max_frame_duration = 0;
 	
-	last_frame = output->last_frame;
 	for (cur_frame = output->first_frame; cur_frame < last_frame; cur_frame++)
 	{
 		output->total_frames_size += cur_frame->size;
@@ -912,13 +933,6 @@ audio_filter_update_track(audio_filter_state_t* state)
 		}
 	}
 	
-	if (output->media_info.min_frame_duration == 0)
-	{
-		vod_log_error(VOD_LOG_ERR, state->request_context->log, 0,
-			"audio_filter_update_track: min frame duration is zero");
-		return VOD_UNEXPECTED;
-	}
-
 	// update media info
 	old_timescale = output->media_info.timescale;
 	output->media_info.timescale = state->sink.encoder->time_base.den;
diff --git a/vod/mp4/mp4_builder.c b/vod/mp4/mp4_builder.c
index 609c2a5..3e52305 100644
--- a/vod/mp4/mp4_builder.c
+++ b/vod/mp4/mp4_builder.c
@@ -239,7 +239,7 @@ mp4_builder_frame_writer_process(fragment_writer_state_t* state)
 				continue;
 			}
 
-			// buffers not continguous, flush the write buffer
+			// buffers not contiguous, flush the write buffer
 			rc = state->write_callback(state->write_context, write_buffer, write_buffer_size, &cur_reuse_buffer);
 			if (rc != VOD_OK)
 			{

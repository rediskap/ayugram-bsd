diff --git Telegram/cmake/generate_lang.cmake Telegram/cmake/generate_lang.cmake
index ec8518b..13ed759 100644
--- Telegram/cmake/generate_lang.cmake
+++ Telegram/cmake/generate_lang.cmake
@@ -42,7 +42,7 @@ function(generate_lang target_name lang_file src_loc)
 
         set(subset_headers "")
         foreach (entry ${lang_sources})
-            if (entry MATCHES "\\.(cpp|mm)$")
+            if (entry MATCHES "\\.(cpp|mm)$" AND NOT entry MATCHES "/ayu/|/boxes/peer_list_controllers.cpp|/boxes/send_files_box.cpp|/boxes/sticker_set_box.cpp|/chat_helpers/gifs_list_widget.cpp|/chat_helpers/stickers_list_widget.cpp|/chat_helpers/ttl_media_layer_widget.cpp|/dialogs/dialogs_inner_widget.cpp|/dialogs/dialogs_widget.cpp|/history/history_item_components.cpp|/history/history_widget.cpp|/history/view/controls/history_view_voice_record_bar.cpp|/history/view/history_view_context_menu.cpp|/history/view/history_view_top_bar_widget.cpp|/info/info_wrap_widget.cpp|/info/profile/info_profile_actions.cpp|/info/saved/info_saved_music_common.cpp|/media/stories/media_stories_controller.cpp|/menu/menu_send.cpp|/settings/sections/settings_active_sessions.cpp|/settings/sections/settings_main.cpp|/settings/sections/settings_premium.cpp|/tray.cpp|/window/window_controller.cpp|/window/window_main_menu.cpp")
                 file(RELATIVE_PATH relative ${src_loc} ${entry})
                 list(APPEND subset_headers ${gen_dst}/lang_subsets/${relative}.h)
                 set_property(SOURCE ${entry} APPEND PROPERTY COMPILE_DEFINITIONS

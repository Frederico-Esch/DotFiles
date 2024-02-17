#include <stdio.h>
#include <playerctl.h>

void polybar_update() { system("polybar-msg action '#musiquinha.hook.0'"); }
void polybar_error() { system("polybar-msg action '#musiquinha.hook.1'"); }

void check_error(GError *error) {
    if (error != 0) {
        perror("ERROR: ");
        if (error->message)
            fprintf(stderr, "%s\n", error->message);
        else
            perror("No message");
        memset(error, 0, sizeof(GError));
    }
}

//example
//gboolean ask_metadata(PlayerctlPlayerManager* manager) {
//    GError *error = NULL;
//    GValue value;
//    g_object_get_property(G_OBJECT(manager), "players", &value);
//    GList *players = g_value_get_pointer(&value);
//
//    for (int i = 0; i < g_list_length(players); i++) {
//        char* rating = playerctl_player_print_metadata_prop(g_list_nth(players, i)->data, NULL, &error);
//        check_error(error);
//        printf("%s\n", rating);
//        free(rating);
//    }
//
//    fflush(stdout);
//    return TRUE;
//}

void on_name_appeared(PlayerctlPlayerManager* manager, PlayerctlPlayerName* name) {
    fprintf(stderr, "%s\n", name->name);
    if (strcmp(name->name, "spotify")) {
        perror("Not spotify, aborting");
        fflush(stderr);
        return;
    }
    GError *error = NULL;
    PlayerctlPlayer * player = playerctl_player_new_from_name(name, &error);
    check_error(error);

    playerctl_player_manager_manage_player(manager, player);
    fflush(stderr);
}

void on_player_appeared(PlayerctlPlayerManager* manager, PlayerctlPlayer* player) {
    GError *error = NULL;
    g_signal_connect(player, "playback-status::playing", polybar_update, NULL);
    g_signal_connect(player, "playback-status::paused", polybar_update, NULL);
    g_signal_connect(player, "metadata", polybar_update, NULL);
    check_error(error);
}

void on_player_vanished(PlayerctlPlayerManager* manager, PlayerctlPlayer* player) {
    fprintf(stderr, "vanished\n");
    polybar_update();
    fflush(stderr);
    g_object_unref(player);
}

int main() {
    GError *error = NULL;
    PlayerctlPlayerManager* manager = playerctl_player_manager_new(&error);
    check_error(error);

    g_signal_connect(manager, "name-appeared", G_CALLBACK(on_name_appeared), NULL);
    g_signal_connect(manager, "player-appeared", G_CALLBACK(on_player_appeared), NULL);
    g_signal_connect(manager, "player-vanished", G_CALLBACK(on_player_vanished), NULL);

    //g_timeout_add_seconds(5, (GSourceFunc)&ask_metadata, manager); example

    GMainLoop * main_loop = g_main_loop_new(NULL, FALSE);
    g_main_loop_run(main_loop);
    return 0;
}

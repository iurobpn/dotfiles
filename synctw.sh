#!bin/bash

tw_gcal_sync -c "work" -t "work" --google-secret "$HOME/Documents/credentials/gcal_api_client_secret.json"
tw_gcal_sync -c "home" -t "home" --google-secret "$HOME/Documents/credentials/gcal_api_client_secret.json"
tw_gcal_sync -c "phd" -t "phd" --google-secret "$HOME/Documents/credentials/gcal_api_client_secret.json"

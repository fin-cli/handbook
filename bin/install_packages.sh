#!/bin/bash

# Installs the 4 non-bundled packages in `bin/packages`. To be run before using the `fin handbook` commands.

FIN_CLI_PACKAGES_DIR=bin/packages FIN_CLI_CONFIG_PATH=/dev/null fin package install fin-cli/admin-command
FIN_CLI_PACKAGES_DIR=bin/packages FIN_CLI_CONFIG_PATH=/dev/null fin package install fin-cli/find-command
FIN_CLI_PACKAGES_DIR=bin/packages FIN_CLI_CONFIG_PATH=/dev/null fin package install fin-cli/profile-command
FIN_CLI_PACKAGES_DIR=bin/packages FIN_CLI_CONFIG_PATH=/dev/null fin package install fin-cli/dist-archive-command

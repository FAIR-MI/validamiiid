# Development image for valida-miiid shiny application
# Charlie Pauvert
# 2023-06-25

FROM rocker/tidyverse:4.2
RUN install2.r --error styler golem bslib shinyAce shinythemes jsonvalidate yaml devtools spelling attachment rhub rsconnect gargoyle

# Add configuration file for Rstudio
RUN echo '{\
    "save_workspace": "never",\
    "always_save_history": false,\
    "reuse_sessions_for_project_links": true,\
    "help_font_size_points": 14,\
    "initial_working_directory": "/data",\
    "font_size_points": 14,\
    "posix_terminal_shell": "bash",\
    "server_editor_font_enabled": true,\
    "server_editor_font": "Hack"\
}' > /home/rstudio/.config/rstudio/rstudio-prefs.json


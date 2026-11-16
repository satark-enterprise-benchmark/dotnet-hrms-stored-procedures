# Shutdown Guide — dotnet-hrms-stored-procedures

No containerized lifecycle exists.

On a Windows IIS deployment (when one exists):

1. Stop the IIS site / application pool
2. Stop MySQL if it is dedicated to this benchmark and no longer needed

There is nothing to shut down in the current macOS/Linux documentation host checkout beyond ending editor/IDE processes.

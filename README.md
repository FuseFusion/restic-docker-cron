# restic-docker-cron
A simple Docker container to run Restic with Cron.

This container is based on Alpine Linux and includes the Restic binary along with two Bash scripts to run backup tasks on a Cron schedule, all self-contained within this container.

Currently, this container works with the Restic REST server and the S3 backend.

## Variables
| Variable                    | Description                                                                                                                                                                       |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| ```CRON_BACKUP```           | Sets the Cron schedule for when you want the backup to start.                                                                                                                     |
| ```TZ```                    | Sets the timezone.                                                                                                                                                               |
| ```BACKUP_PATH```           | The path inside the container that should be backed up. This must match the path you mapped your folder to. For example, with ```-v /home/user:/data``` the variable should be set to ```/data```. |
| ```RESTIC_REPOSITORY```     | The Restic repository path.                                                                                                                                                     |
| ```RESTIC_PASSWORD```       | The password for the Restic repository.                                                                                                                                           |
| ```RESTIC_TAG```            | Tags to be assigned to the snapshots. Multiple tags can be added by separating them with a space.                                                                                |
| ```RESTIC_COMPRESSION```    | Compression level Restic should use. Can be set to ```max```, ```auto```, or ```off```. If not set, it defaults to ```auto```.                                                  |
| ```RESTIC_REST_USERNAME```  | Username for the REST server. Can be ignored when using the S3 backend.                                                                                                          |
| ```RESTIC_REST_PASSWORD```  | Password for the REST server. Can be ignored when using S3.                                                                                                                      |
| ```AWS_SECRET_ACCESS_KEY``` | Secret access key for the S3 repository. Can be ignored when using the REST server.                                                                                              |
| ```AWS_ACCESS_KEY_ID```     | Access key ID for the S3 repository. Can be ignored when using the REST server.                                                                                                  |

## Usage

Deploy the container as desired using Docker Compose or docker run. The mandatory environment variables are: ```CRON_BACKUP```, ```BACKUP_PATH```, ```RESTIC_REPOSITORY```, ```RESTIC_PASSWORD```, and those required for either the REST server or the S3 backend. These must be set for the container to function.

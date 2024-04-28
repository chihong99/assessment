# We+ Assessment
----------------

Create a Bash script that automates the creation of snapshots for Amazon EC2 instances and cleans up old snapshots.

## Requirements
- AWS CLI Setup: The script should assume that AWS CLI is already configured on the machine where it will run.
- Instance Identification: The script should take an instance ID as an input argument.
- Snapshot Creation: For the specified EC2 instance, the script should create a new snapshot of its root volume.
- Snapshot Tagging: After creating a snapshot, the script should tag it with the current date (format: YYYY-MM-DD) and a custom tag “Backup” with the value “Daily”.
- Cleanup: The script should delete snapshots older than 7 days for the specified instance.
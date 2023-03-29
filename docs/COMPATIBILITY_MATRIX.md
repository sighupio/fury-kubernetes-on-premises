# Compatibility Matrix

| Module Version / Kubernetes Version       | 1.15.X             | 1.19.X             | 1.20.15            | 1.21.14            | 1.22.13            | 1.23.12            | 1.24.7             | 1.25.6             |
|-------------------------------------------|:------------------:|:------------------:|:------------------:|:------------------:|:------------------:|:------------------:|:------------------:|:------------------:|
| v1.15.4                                   | :white_check_mark: |                    |                    |                    |                    |                    |                    |                    |
| v1.19.7                                   |                    | :white_check_mark: |                    |                    |                    |                    |                    |                    |
| v1.20.15                                  |                    |                    | :white_check_mark: |                    |                    |                    |                    |                    |
| v1.21.14                                  |                    |                    | :white_check_mark: | :white_check_mark: |                    |                    |                    |                    |
| v1.22.13                                  |                    |                    |                    | :warning:          | :warning:          |                    |                    |                    |
| v1.23.12                                  |                    |                    |                    | :warning:          | :warning:          | :warning:          |                    |                    |
| v1.23.12-rev.1                            |                    |                    |                    | :white_check_mark: | :white_check_mark: | :white_check_mark: |                    |                    |
| v1.24.7                                   |                    |                    |                    |                    |                    | :white_check_mark: | :white_check_mark: |                    |
| v1.25.6                                   |                    |                    |                    |                    |                    | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| v1.25.6-rev.1                             |                    | :warning:          | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: | :white_check_mark: |

- :white_check_mark: Compatible
- :warning: Has issues
- :x: Incompatible

Notes:

- `v1.23.12-rev.1` fixes an issue with yum-versionlock on RHEL systems, Ansible Roles can be used with `1.21.14`, `1.22.13` and `1.23.12` Kubernetes versions.
- `v1.25.6-rev.1` adds the possibility to install older Kubernetes versions.


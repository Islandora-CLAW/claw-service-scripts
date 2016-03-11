# Islandora CLAW Service Scripts

### Introduction

Just a set of scripts for generating data and testing / debugging Drupal
Services written for Islandora CLAW.

### Dependencies

* Python 2.7
* Bash

### Commands

A number of bash scripts for making requests or generating data, square brakes
indicate optional parameters.

| Command        | Arguments              | Notes                                                                             |
|----------------|------------------------|-----------------------------------------------------------------------------------|
| login.sh       | [username], [password] | Log in as the given user, or as [configs/credentials.json](configs).              |
| get-node.sh    | uuid                   | Gets the given node's attributes and puts the output in the [data folder](/data). |
| set-node.sh    | uuid                   | Sets the given node's attributes using the output data from get-node.sh.          |
| medium-size.sh | uuid, image file       | Generates an medium size image for the given basic image object.                  |

### Maintainers/Sponsors

Current maintainers:

* [Nigel Banks](https://github.com/nigelgbanks)

### Development

If you would like to contribute, please get involved with the
[Islandora Fedora 4 Interest Group] We love to hear from you!

If you would like to contribute code to the project, you need to be covered by
an Islandora Foundation [Contributor License Agreement] or
[Corporate Contributor License Agreement]. Please see the [Contributors] pages
on Islandora.ca for more information.

### License

[GPLv3](http://www.gnu.org/licenses/gpl-3.0.txt)

### Reference Material

* [Drupal Services]

[Contributor License Agreement]: http://islandora.ca/sites/default/files/islandora_cla.pdf
[Contributors]: http://islandora.ca/resources/contributors
[Corporate Contributor License Agreement]: http://islandora.ca/sites/default/files/islandora_ccla.pdf
[Islandora Fedora 4 Interest Group]: https://github.com/Islandora/Islandora-Fedora4-Interest-Group

[Drupal Services]: https://www.drupal.org/project/services

# angularapp Cookbook

This cookbook is designed for use in both a production and development environments.  It can be used locally leveraging the Berkshelf vagrant plugin and on AWS using an OpsWorks stack.

## Recipes

### system
This recipe installs all system-level dependencies.

### code
This recipe fetches the source of the application.  _It is intended to be run only on OpsWorks._

### app
This recipe assumes the application source exists and installs any dependencies kept in version control. It configures the application based on environment variables.  Lastly, any database schema changes are applied.

## License and Authors
Copyright (C) APAX Software Development, LLC - All Rights Reserved

Unauthorized copying of this file, via any medium is strictly prohibited

Proprietary and confidential

Written by Chris Allen <chris@apaxsoftware.com>, May 2017
/*
 * Author:: Ryan Hass <rhass@chef.io>
 * Copyright:: Copyright (c) 2017, Chef Software Inc.
 * License:: Apache License, Version 2.0
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

const tty = require('tty');
const chalk = require('chalk');

/**
 * Habitat colorized logger
 * @constructor
 * @param {string}
 */
class Logger {

  constructor(event) {
    this.event = event;
    this.pkg_name = pkg_name;
  }

  /**
   * Checks to see if the build is running in an interactive TTY or not.
   * If not, we assume no color support is available. Users can disable
   * color output with the HAB_NOCOLORING environment variable as well.
   * @returns {boolean}
   */
  static colorSupported() {
    if (tty.isatty(process.stdout.fd) && process.env.HAB_NOCOLORING != "true") {
      return true
    } else {
      return false
    }
  }

  /**
   * Prints log events to console.log and colorizes the output when appropriate.
   * @param str
   */
  info(str) {
    if (this.colorSupported()) {
      console.log(`   ${chalk.cyan(this.pkg_name)}: ${str}`);
    } else {
      console.log(`   ${this.pkg_name}: ${str}`);
    }
  }

  /**
   * Helper function to preserve API compatibility with Bash & PowerShell Plans
   * and wraps @this.info.
   * @param str
   */
  build_line(str) {
    this.info(str);
  }

  /**
   * Prints log events via console.warn and colorizes the output when appropriate.
   * @param str
   */
  warn(str) {
    if (this.colorSupported()) {
      console.warn(`   ${chalk.cyan(this.pkg_name)}: ${chalk.yellow('WARN')} ${str}`);
    } else {
      console.warn(`   ${this.pkg_name}: WARN ${str}`);
    }
  }

  /**
   * Prints log events via console.warn and colorizes the output when appropriate.
   * @param str
   */
  error(str) {
    if (this.colorSupported()) {
      console.error(`   ${chalk.cyan(this.pkg_name)}: ${chalk.red('ERROR')} ${str}`);
    } else {
      console.error(`   ${this.pkg_name}: ERROR ${str}`);
    }
  }

  /**
   * Helper function to preserve API compatibility with Bash & PowerShell Plans.
   * Prints event message via console.error and exits with a user specified exit
   * status.
   * @param str
   * @param status
   */
  exit_with(str, status) {
    this.error(str);
    process.exit(status);
  }
}
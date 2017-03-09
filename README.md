# Montessori Monitor
##### by Daniel Brad


# Description

My toddler gets a paper "daily report" from his nursery school sent home with him every day. I created Montessori Monitor as a tool to get paper out of this process. Schools can use it to create and email daily reports, and also make those reports available on their website in a secure manner. Authentication and authorization are handled by Devise and Pundit, respectively.

# Installation

To install:

1. Fork and clone this repo
2. From your terminal, enter:
  ```bash
  bundle install
  ```
3. Then:
  ```bash
  rake db:migrate
  ```
4. Open the db/seeds/rb file and modify the User information inside to create an administrator profile. Then in terminal, enter:

  ```bash
  rake db:seed
  ```
5. To utilize the email functionality, you must configure the web app to your email account. It is currently set up to work with gmail, but you will need to set environment variables for your username and password. If using a gmail account, create a file named .env in your root directory and inside of it set your gmail username and password as such:

  ```
  gmail_username=youremail@gmail.com
  gmail_password=yourpassword
  ```

# Usage


# license

Copyright (c) 2016 Daniel Brad

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

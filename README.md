![](https://img.shields.io/badge/Microverse-blueviolet)
# PRIVATE EVENTS AT EVENTS.IO

  
## Getting started

- Clone the repo `https://github.com/SamArsanios/private-events.git`
- `cd` into the private-events
- Run `git checkout -b events`
- Run `git pull origin events`
- Run `bundle install`
- Run `$ rails db:create` to create database
- Run `rails db:migrate` to get the schema


## Features
This is the homepage for for our Events Application
![screenshot](./app/assets/images/screenshot.JPG)

- Start the rails server by running
```rails s```
Visit `http://localhost:3000/`

#### Signing_Up
- Fill the name field in the sign up form and submit to be identified as a new user

#### Create a new Event
- Go to the create event link at the very top on the navbar to fill a creata event form
- All the information will be placed in the events which you can access via the Event link on the navbar
- Events are subdivided into upcoming and past events

#### Logging_out
- Once a user is logged put they can only be able to see the upcoming and the past events but cannot be able  
  to create one

## Working

Refer [This Article](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations) for more instruction and to test this project

## Author

👤 Rose Sumba

- GitHub: [@ZawadiSumba66](https://github.com/ZawadiSumba66)
- Twitter: [@zawadirose1](https://twitter.com/zawadirose1)
- LinkedIn: [rose-sumba](https://www.linkedin.com/in/rose-sumba-9b36401b5/)


👤 **SamArsanios**

- Github: [@SamArsanios](https://github.com/SamArsanios)
- Twitter: [@SamArsanios](https://twitter.com/SamArsanios)
- LinkedIn: [Samson](https://www.linkedin.com/in/samson-kibrom/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the issues page.

Show your support

Give a ⭐️ if you like this project!

## 📝 License

&copy; 2021 Samson and Rose

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE.

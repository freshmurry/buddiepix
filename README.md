# How to build Instagram using Ruby on Rails

First, let me start by saying that I pieced this app together using a few different git repos and online tutorials.

The majority of the code seen here was forked from: https://github.com/truongnmt/instagram-clone. However, I was able to integrate a few additions such as:

<li>Added count and links for "Posts, Followers, and Following" on user's profile page</li> 
<li>Added the ability to a link to your website (currently not working)</li> 
<li>Added the ability to update and upload a profile photo</li> 

This is source code for the course: [How to build Instagram using Ruby on Rails](https://www.udemy.com/course/1648774/) 

## Demo
Here is a working live demo: https://longram.herokuapp.com/
Here is a working live demo (with Follow/Unfollow feature): https://instafakeapp.herokuapp.com/

## Site

### Landing Page
User can login using email/password or using social account.
![landing page](screenshots/landing.png)

### Home Page
![home page](screenshots/home.png)

### Post Detail Page
![post detail page](screenshots/post_detail.png)

### My Page
![my page](screenshots/mypage.png)

### Profile Page
![profile page](screenshots/profile.png)

### Development
Want to contribute? Great!

To fix a bug or enhance an existing module, follow these steps:

- Fork the repo
- Create a new branch (`git checkout -b improve-feature`)
- Make the appropriate changes in the files
- Add changes to reflect the changes made
- Commit your changes (`git commit -am 'Improve feature'`)
- Push to the branch (`git push origin improve-feature`)
- Create a Pull Request

### Bug / Feature Request

If you find a bug, kindly open an issue [here](https://github.com/truongnmt/instagram-udemy/issues/new).

## Built with
- Ruby 2.5
- Rails 5.1.6+
- jQuery - Ajax - jQuery simplifies HTML document traversing, event handling, animating, and Ajax interactions for rapid web development.
- [Bootstrap 4](http://getbootstrap.com/) - Extensive list of components and  Bundled Javascript plugins.
- Awesome [Gems](Gemfile)

## [License](LICENSE.md)

MIT © [Truong Nguyen](https://github.com/truongnmt)
MIT © [Lawrence Murry](https://github.com/freshmurry)

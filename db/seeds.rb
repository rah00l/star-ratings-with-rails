
Role.create! name: "Admin"
Role.create! name: "Author"
Role.create! name: "Organiger"
Role.create! name: "Photographer"
Role.create! name: "Other"

#User.create! email: "soopriya@gmail.com", password: "soopriya123", password_confirmation: "soopriya123"


batman = Article.create! name: "Batman", content: <<-ARTICLE
Batman is a fictional character created by the artist Bob Kane and writer Bill Finger. A comic book superhero, Batman first appeared in Detective Comics #27 (May 1939), and since then has appeared primarily in publications by DC Comics. Originally referred to as "The Bat-Man" and still referred to at times as "The Batman", he is additionally known as "The Caped Crusader", "The Dark Knight", and the "World's Greatest Detective," among other titles. (from Wikipedia)
ARTICLE

superman = Article.create! name: "Superman", content: <<-ARTICLE
Superman is a fictional comic book superhero appearing in publications by DC Comics, widely considered to be an American cultural icon. Created by American writer Jerry Siegel and Canadian-born American artist Joe Shuster in 1932 while both were living in Cleveland, Ohio, and sold to Detective Comics, Inc. (later DC Comics) in 1938, the character first appeared in Action Comics #1 (June 1938) and subsequently appeared in various radio serials, television programs, films, newspaper strips, and video games. (from Wikipedia)
ARTICLE

krypton = Article.create! name: "Krypton", content: <<-ARTICLE
Krypton is a fictional planet in the DC Comics universe, and the native world of the super-heroes Superman and, in some tellings, Supergirl and Krypto the Superdog. Krypton has been portrayed consistently as having been destroyed just after Superman's flight from the planet, with exact details of its destruction varying by time period, writers and franchise. Kryptonians were the dominant people of Krypton. (from Wikipedia)
ARTICLE

lex_luthor = Article.create! name: "Lex Luthor", content: <<-ARTICLE
Lex Luthor is a fictional character, a supervillain who appears in comic books published by DC Comics. He is the archenemy of Superman, and is also a major adversary of Batman and other superheroes in the DC Universe. Created by Jerry Siegel and Joe Shuster, he first appeared in Action Comics #23 (April 1940). Luthor is described as "a power-mad, evil scientist" of high intelligence and incredible technological prowess. (from Wikipedia)
ARTICLE

robin = Article.create! name: "Robin", content: <<-ARTICLE
Robin is the name of several fictional characters appearing in comic books published by DC Comics, originally created by Bob Kane, Bill Finger and Jerry Robinson, as a junior counterpart to DC Comics superhero Batman. The team of Batman and Robin is commonly referred to as the Dynamic Duo or the Caped Crusaders. (from Wikipedia)
ARTICLE

robin = Article.create! name: "Robin", content: <<-ARTICLE
Robin is the name of several fictional characters appearing in comic books published by DC Comics, originally created by Bob Kane, Bill Finger and Jerry Robinson, as a junior counterpart to DC Comics superhero Batman. The team of Batman and Robin is commonly referred to as the Dynamic Duo or the Caped Crusaders. (from Wikipedia)
ARTICLE


ruby = Article.create! name: "About Ruby", content: <<-ARTICLE
Ruby is a language of careful balance. Its creator, Yukihiro Matz Matsumoto, blended parts of his favorite languages (Perl, Smalltalk, Eiffel, Ada, and Lisp) to form a new language that balanced functional programming with imperative programming.
He has often said that he is 'trying to make Ruby natural, not simple,' in a way that mirrors life.Building on this, he adds:Ruby is simple in appearance, but is very complex inside, just like our human body1.
ARTICLE


rails = Article.create! name: "About Rails", content: <<-ARTICLE
This guide is designed for beginners who want to get started with a Rails application from scratch. It does not assume that you have any prior experience with Rails. However, to get the most out of it, you need to have some prerequisites installed:
ARTICLE


info = Article.create! name: "What is Rails?", content: <<-ARTICLE
Rails is a web application development framework written in the Ruby language. It is designed to make programming web applications easier by making assumptions about what every developer needs to get started. It allows you to write less code while accomplishing more than many other languages and frameworks. Experienced Rails developers also report that it makes web application development more fun.
ARTICLE


features = Article.create! name: "Don't Repeat Yourself", content: <<-ARTICLE
DRY is a principle of software development which states that "Every piece of knowledge must have a single, unambiguous, authoritative representation within a system." By not writing the same information over and over again, our code is more maintainable, more extensible, and less buggy.
ARTICLE


feature1 = Article.create! name: "Convention Over Configuration", content: <<-ARTICLE
Rails has opinions about the best way to do many things in a web application, and defaults to this set of conventions, rather than require that you specify every minutiae through endless configuration files.
ARTICLE

new_project = Article.create! name: "New Rails Project", content: <<-ARTICLE
The best way to use this guide is to follow each step as it happens, no code or step needed to make this example application has been left out, so you can literally follow along step by step. You can get the complete code
ARTICLE

blog_app = Article.create! name: "Blog Application", content: <<-ARTICLE
Rails comes with a number of scripts called generators that are designed to make your development life easier by creating everything that's necessary to start working on a particular task. One of these is the new application generator, which will provide you with the foundation of a fresh Rails application so that you don't have to write it yourself.
ARTICLE


execjs = Article.create! name: "Execjs", content: <<-ARTICLE
Compiling CoffeeScript to JavaScript requires a JavaScript runtime and the absence of a runtime will give you an execjs error. Usually Mac OS X and Windows come with a JavaScript runtime installed. Rails adds the therubyracer gem to the generated Gemfile in a commented line for new apps and you can uncomment if you need it. therubyrhino is the recommended runtime for JRuby users and is added by default to the Gemfile in apps generated under JRuby. You can investigate about all the supported runtimes at
ARTICLE

say_hello = Article.create! name: "Say 'Hello', Rails", content: <<-ARTICLE
A controller's purpose is to receive specific requests for the application. Routing decides which controller receives which requests. Often, there is more than one route to each controller, and different routes can be served by different actions. Each action's purpose is to collect information to provide it to a view.
ARTICLE

secure_rails = Article.create! name: "Ruby on Rails Security Guide", content: <<-ARTICLE
Web application frameworks are made to help developers build web applications. Some of them also help you with securing the web application. In fact one framework is not more secure than another: If you use it correctly, you will be able to build secure apps with many frameworks. Ruby on Rails has some clever helper methods, for example against SQL injection, so that this is hardly a problem. It's nice to see that all of the Rails applications I audited had a good level of security.
ARTICLE


sessions = Article.create! name: "Sessions", content: <<-ARTICLE
Most applications need to keep track of certain state of a particular user. This could be the contents of a shopping basket or the user id of the currently logged in user. Without the idea of sessions, the user would have to identify, and probably authenticate, on every request. Rails will create a new session automatically if a new user accesses the application. It will load an existing session if the user has already used the application.
ARTICLE


session_hijacking = Article.create! name: "Session Hijacking", content: <<-ARTICLE
Stealing a user's session id lets an attacker use the web application in the victim's name. Many web applications have an authentication system: a user provides a user name and password, the web application checks them and stores the corresponding user id in the session hash. From now on, the session is valid. On every request the application will load the user, identified by the user id in the session, without the need for new authentication. The session id in the cookie identifies the session.
ARTICLE

session_storage = Article.create! name: "Session Storage", content: <<-ARTICLE
Rails provides several storage mechanisms for the session hashes. The most important is ActionDispatch::Session::CookieStore.Rails 2 introduced a new default session storage, CookieStore. CookieStore saves the session hash directly in a cookie on the client-side. The server retrieves the session hash from the cookie and eliminates the need for a session id. That will greatly increase the speed of the application, but it is a controversial storage option and you have to think about the security implications of it:
ARTICLE

CSRF = Article.create! name: "Cross-Site Request Forgery (CSRF)", content: <<-ARTICLE
This attack method works by including malicious code or a link in a page that accesses a web application that the user is believed to have authenticated. If the session for that web application has not timed out, an attacker may execute unauthorized commands.
ARTICLE

protect_from_forgery = Article.create! name: "Protect From Forgery", content: <<-ARTICLE
This will automatically include a security token in all forms and Ajax requests generated by Rails. If the security token doesn't match what was expected, the session will be reset.
ARTICLE

secure_rails1 = Article.create! name: "Redirection and Files", content: <<-ARTICLE
Whenever the user is allowed to pass (parts of) the URL for redirection, it is possibly vulnerable. The most obvious attack would be to redirect users to a fake web application which looks and feels exactly as the original one. This so-called phishing attack works by sending an unsuspicious link in an email to the users, injecting the link by XSS in the web application or putting the link into an external site. It is unsuspicious, because the link starts with the URL to the web application and the URL to the malicious site is hidden in the redirection parameter: http://www.example.com/site/redirect?to= www.attacker.com. Here is an example of a legacy action:
ARTICLE

secure_rails2 = Article.create! name: "Self-contained XSS", content: <<-ARTICLE
Another redirection and self-contained XSS attack works in Firefox and Opera by the use of the data protocol. This protocol displays its contents directly in the browser and can be anything from HTML or JavaScript to entire images:
ARTICLE



Event.create! name: "Capture the Joker", starts_at: 2.days.from_now, ends_at: 3.days.from_now, description: "The Joker is at it again. Find his secret lair and capture him to keep him from causing more trouble."

Event.create! name: "Save the World", starts_at: 2.weeks.from_now, ends_at: 3.weeks.from_now, description: "An astroid is expected to collide with Earth around this time. It's a bird, it's a plain, it's Superman!"

Photo.create! name: "The Dark Knight Rises", filename: "dark_knight_rises.jpg"
Photo.create! name: "Superman", filename: "superman.jpg"


admin_role = Role.find_or_create_by_name("Admin")
author_role = Role.find_or_create_by_name("Author")
org_role= Role.find_or_create_by_name("organizer")
photo_role = Role.find_or_create_by_name("Photographer")
other_role = Role.find_or_create_by_name("Other")

User.delete_all

puts 'DEFAULT ADMIN USER..'
# admin_user = User.find_or_create_by_email :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
admin_user = User.create! email: "rahul@gmail.com", password: "rahul123", password_confirmation: "rahul123"
admin_user.role_ids=(admin_role.id)

#open("http://openconcept.ca/sites/openconcept.ca/files/country_code_drupal_0.txt") {|countr| countr.read.each_line {|con| code, name = con.chomp.split("|"); Country.create!(:name => name, :code => code)}}


Country.delete_all
open("http://openconcept.ca/sites/openconcept.ca/files/country_code_drupal_0.txt") do |countries|
  countries.read.each_line do |country|
    code, name = country.chomp.split("|")
    Country.create!(:name => name, :code => code)
  end
end

c1 = Country.find_by_name "India"
c2 = Country.find_by_name "United States"

State.delete_all

states1 = [{code: "MH", name: "Maharashtra", country_id: c1.id }, {code: "KA", name: "Karnataka", country_id: c1.id },
		  {code: "AP", name: "Andhra Pradesh", country_id: c1.id }, {code: "PB", name: "Punjab", country_id: c1.id }]



states2 = [{code: "CA", name: "California", country_id: c2.id }, {code: "GA", name: "Georgia", country_id: c2.id } ,
		  {code: "NJ", name: "New Jersey", country_id: c2.id }, {code: "NY", name: "New York", country_id: c2.id }]


State.create! states1
State.create! states2

s1 = State.find_by_name "Maharashtra"
s2 = State.find_by_name "Karnataka"
s3 = State.find_by_name "Andhra Pradesh"
s4 = State.find_by_name "Punjab"

s5 = State.find_by_name "California"
s6 = State.find_by_name "Georgia"
s7 = State.find_by_name "New Jersey"
s8 = State.find_by_name "New York" 	

City.delete_all

cities1 = [{code: "PN", name: "Pune", state_id: s1.id }, {code: "MB", name: "Mumbai", state_id: s1.id },
		  {code: "KOP", name: "Kolhapur", state_id: s1.id }, {code: "SL", name: "Sangli", state_id: s1.id }]

cities2 = [{code: "BNG", name: "Banglore", state_id: s2.id }, {code: "HBL", name: "Hubli", state_id: s2.id } ,
		  {code: "NP", name: "Nipani", state_id: s2.id }, {code: "CHD", name: "Chikodi", state_id: s2.id }]

cities3 = [{code: "HYD", name: "Hydrabad", state_id: s3.id }, {code: "VJ", name: "Vijayawada", state_id: s3.id },
		  {code: "TRP", name: "Tirupati", state_id: s3.id }, {code: "GNT", name: "Guntur", state_id: s3.id }]

cities4 = [{code: "LDN", name: "Ludhiana", state_id: s4.id }, {code: "AMT", name: "Amritsar", state_id: s4.id },
		  {code: "PTL", name: "Patiala", state_id: s4.id }, {code: "BTD", name: "Bathinda", state_id: s4.id }]		  

cities5 = [{code: "LNG", name: "Los Angeles", state_id: s5.id }, {code: "SCM", name: "Sacramento", state_id: s5.id }]

cities6 = [{code: "ATL", name: "Atlanta", state_id: s6.id }]

cities7 = [{code: "TRN", name: "Trenton", state_id: s7.id }, {code: "NK", name: "Newark", state_id: s7.id }]

cities8 = [{code: "ALB", name: "Albany", state_id: s8.id }, {code: "NCY", name: "New York", state_id: s8.id }]
 	

City.create! cities1 
City.create! cities2
City.create! cities3
City.create! cities4
City.create! cities5
City.create! cities6
City.create! cities7
City.create! cities8

# State(name: string, code: string, country_id: integer, created_at: datetime, updated_at: datetime)

# City.delete_all
# City.create!(name: "Pune" , code: "PN")

# admin_user = User.find_or_create_by_email_and_password_and_password_confirmation("admin@example.com" ,"admin@123" , "admin@123") 
# admin_user.role_ids=([admin_role.id])

# author_user = User.create! email: "author@example.com" ,password: "user@123" ,password_confirmation: "user@123"
# author_user.role_ids=([author_role.id])

# user1 = User.create! email: "user1@example.com" ,password: "user@123" ,password_confirmation: "user@123"

# user2 = User.create! email: "user2@example.com" ,password: "user@123" ,password_confirmation: "user@123"

# user3 = User.create! email: "user3@example.com" ,password: "user@123" ,password_confirmation: "user@123"


# org_user = User.create! email: "organizer@example.com" ,password: "user@123" ,password_confirmation: "user@123"
# org_user.role_ids=([org_role.id])

# photo_user = User.create! email: "photo@example.com" ,password: "user@123" ,password_confirmation: "user@123"
# photo_user.role_ids=([photo_role.id])

# other_user = User.create! email: "other@example.com" ,password: "user@123" ,password_confirmation: "user@123"
# other_user.role_ids=([other_role.id])
Article.delete_all

batman = Article.create! name: "Batman", created_at: (rand*30).days.ago, content: <<-ARTICLE
Batman is a fictional character created by the artist Bob Kane and writer Bill Finger. A comic book superhero, Batman first appeared in Detective Comics #27 (May 1939), and since then has appeared primarily in publications by DC Comics. Originally referred to as "The Bat-Man" and still referred to at times as "The Batman", he is additionally known as "The Caped Crusader", "The Dark Knight", and the "World's Greatest Detective," among other titles. (from Wikipedia)
ARTICLE
# batman.update_attribute :created_at, (rand*30).days.ago
# batman.user_id=(author_user.id)

superman = Article.create! name: "Superman", created_at: (rand*30).days.ago, content: <<-ARTICLE
Superman is a fictional comic book superhero appearing in publications by DC Comics, widely considered to be an American cultural icon. Created by American writer Jerry Siegel and Canadian-born American artist Joe Shuster in 1932 while both were living in Cleveland, Ohio, and sold to Detective Comics, Inc. (later DC Comics) in 1938, the character first appeared in Action Comics #1 (June 1938) and subsequently appeared in various radio serials, television programs, films, newspaper strips, and video games. (from Wikipedia)
ARTICLE

krypton = Article.create! name: "Krypton", created_at: (rand*130).days.ago, content: <<-ARTICLE
Krypton is a fictional planet in the DC Comics universe, and the native world of the super-heroes Superman and, in some tellings, Supergirl and Krypto the Superdog. Krypton has been portrayed consistently as having been destroyed just after Superman's flight from the planet, with exact details of its destruction varying by time period, writers and franchise. Kryptonians were the dominant people of Krypton. (from Wikipedia)
ARTICLE
# krypton.update_attribute :created_at, (rand*130).days.ago

lex_luthor = Article.create! name: "Lex Luthor", created_at: (rand*120).days.ago,content: <<-ARTICLE
Lex Luthor is a fictional character, a supervillain who appears in comic books published by DC Comics. He is the archenemy of Superman, and is also a major adversary of Batman and other superheroes in the DC Universe. Created by Jerry Siegel and Joe Shuster, he first appeared in Action Comics #23 (April 1940). Luthor is described as "a power-mad, evil scientist" of high intelligence and incredible technological prowess. (from Wikipedia)
ARTICLE
# lex_luthor.update_attribute :created_at, (rand*120).days.ago

robin = Article.create! name: "Robin", created_at: (rand*130).days.ago,content: <<-ARTICLE
Robin is the name of several fictional characters appearing in comic books published by DC Comics, originally created by Bob Kane, Bill Finger and Jerry Robinson, as a junior counterpart to DC Comics superhero Batman. The team of Batman and Robin is commonly referred to as the Dynamic Duo or the Caped Crusaders. (from Wikipedia)
ARTICLE
# robin.update_attribute created_at: (rand*130).days.ago

programming_language = Article.create! name: "Programming language", created_at: (rand*370).days.ago,content: <<-ARTICLE
Robin is the name of several fictional characters appearing in comic books published by DC Comics, originally created by Bob Kane, Bill Finger and Jerry Robinson, as a junior counterpart to DC Comics superhero Batman. The team of Batman and Robin is commonly referred to as the Dynamic Duo or the Caped Crusaders. (from Wikipedia)
ARTICLE
# programming_language.update_attribute :created_at, (rand*370).days.ago


ruby = Article.create! name: "About Ruby", created_at: (rand*161).days.ago, content: <<-ARTICLE
Ruby is a language of careful balance. Its creator, Yukihiro Matz Matsumoto, blended parts of his favorite languages (Perl, Smalltalk, Eiffel, Ada, and Lisp) to form a new language that balanced functional programming with imperative programming.
He has often said that he is 'trying to make Ruby natural, not simple,' in a way that mirrors life.Building on this, he adds:Ruby is simple in appearance, but is very complex inside, just like our human body1.
ARTICLE
# ruby.update_attribute :created_at, (rand*161).days.ago


rails = Article.create! name: "About Rails", created_at: (rand*61).days.ago, content: <<-ARTICLE
This guide is designed for beginners who want to get started with a Rails application from scratch. It does not assume that you have any prior experience with Rails. However, to get the most out of it, you need to have some prerequisites installed:
ARTICLE
# rails.update_attribute :created_at, (rand*61).days.ago


info = Article.create! name: "What is Rails?", created_at: (rand*112).days.ago,content: <<-ARTICLE
Rails is a web application development framework written in the Ruby language. It is designed to make programming web applications easier by making assumptions about what every developer needs to get started. It allows you to write less code while accomplishing more than many other languages and frameworks. Experienced Rails developers also report that it makes web application development more fun.
ARTICLE
# info.update_attribute :created_at, (rand*112).days.ago


features = Article.create! name: "Don't Repeat Yourself", created_at: (rand*161).days.ago,content: <<-ARTICLE
DRY is a principle of software development which states that "Every piece of knowledge must have a single, unambiguous, authoritative representation within a system." By not writing the same information over and over again, our code is more maintainable, more extensible, and less buggy.
ARTICLE
# features.update_attribute :created_at, (rand*161).days.ago

feature1 = Article.create! name: "Convention Over Configuration", created_at: (rand*31).days.ago,content: <<-ARTICLE
Rails has opinions about the best way to do many things in a web application, and defaults to this set of conventions, rather than require that you specify every minutiae through endless configuration files.
ARTICLE
# features.update_attribute :created_at, (rand*31).days.ago

new_project = Article.create! name: "New Rails Project", created_at: (rand*31).days.ago, content: <<-ARTICLE
The best way to use this guide is to follow each step as it happens, no code or step needed to make this example application has been left out, so you can literally follow along step by step. You can get the complete code
ARTICLE
# new_project.update_attribute :created_at, (rand*31).days.ago


blog_app = Article.create! name: "Blog Application", created_at: (rand*21).days.ago,content: <<-ARTICLE
Rails comes with a number of scripts called generators that are designed to make your development life easier by creating everything that's necessary to start working on a particular task. One of these is the new application generator, which will provide you with the foundation of a fresh Rails application so that you don't have to write it yourself.
ARTICLE
# blog_app.update_attribute :created_at, (rand*21).days.ago

execjs = Article.create! name: "Execjs", created_at: (rand*21).days.ago, content: <<-ARTICLE
Compiling CoffeeScript to JavaScript requires a JavaScript runtime and the absence of a runtime will give you an execjs error. Usually Mac OS X and Windows come with a JavaScript runtime installed. Rails adds the therubyracer gem to the generated Gemfile in a commented line for new apps and you can uncomment if you need it. therubyrhino is the recommended runtime for JRuby users and is added by default to the Gemfile in apps generated under JRuby. You can investigate about all the supported runtimes at
ARTICLE

say_hello = Article.create! name: "Say 'Hello', Rails", created_at: (rand*121).days.ago, content: <<-ARTICLE
A controller's purpose is to receive specific requests for the application. Routing decides which controller receives which requests. Often, there is more than one route to each controller, and different routes can be served by different actions. Each action's purpose is to collect information to provide it to a view.
ARTICLE

secure_rails = Article.create! name: "Ruby on Rails Security Guide", created_at: (rand*271).days.ago, content: <<-ARTICLE
Web application frameworks are made to help developers build web applications. Some of them also help you with securing the web application. In fact one framework is not more secure than another: If you use it correctly, you will be able to build secure apps with many frameworks. Ruby on Rails has some clever helper methods, for example against SQL injection, so that this is hardly a problem. It's nice to see that all of the Rails applications I audited had a good level of security.
ARTICLE


sessions = Article.create! name: "Sessions", created_at: (rand*201).days.ago, content: <<-ARTICLE
Most applications need to keep track of certain state of a particular user. This could be the contents of a shopping basket or the user id of the currently logged in user. Without the idea of sessions, the user would have to identify, and probably authenticate, on every request. Rails will create a new session automatically if a new user accesses the application. It will load an existing session if the user has already used the application.
ARTICLE


session_hijacking = Article.create! name: "Session Hijacking", created_at: (rand*21).days.ago, content: <<-ARTICLE
Stealing a user's session id lets an attacker use the web application in the victim's name. Many web applications have an authentication system: a user provides a user name and password, the web application checks them and stores the corresponding user id in the session hash. From now on, the session is valid. On every request the application will load the user, identified by the user id in the session, without the need for new authentication. The session id in the cookie identifies the session.
ARTICLE
# session_hijacking.update_attribute :created_at, (rand*120).days.ago

session_storage = Article.create! name: "Session Storage", created_at: (rand*210).days.ago, content: <<-ARTICLE
Rails provides several storage mechanisms for the session hashes. The most important is ActionDispatch::Session::CookieStore.Rails 2 introduced a new default session storage, CookieStore. CookieStore saves the session hash directly in a cookie on the client-side. The server retrieves the session hash from the cookie and eliminates the need for a session id. That will greatly increase the speed of the application, but it is a controversial storage option and you have to think about the security implications of it:
ARTICLE

CSRF = Article.create! name: "Cross-Site Request Forgery (CSRF)", created_at: (rand*41).days.ago, content: <<-ARTICLE
This attack method works by including malicious code or a link in a page that accesses a web application that the user is believed to have authenticated. If the session for that web application has not timed out, an attacker may execute unauthorized commands.
ARTICLE

protect_from_forgery = Article.create! name: "Protect From Forgery", created_at: (rand*271).days.ago, content: <<-ARTICLE
This will automatically include a security token in all forms and Ajax requests generated by Rails. If the security token doesn't match what was expected, the session will be reset.
ARTICLE

secure_rails1 = Article.create! name: "Redirection and Files", created_at: (rand*81).days.ago, content: <<-ARTICLE
Whenever the user is allowed to pass (parts of) the URL for redirection, it is possibly vulnerable. The most obvious attack would be to redirect users to a fake web application which looks and feels exactly as the original one. This so-called phishing attack works by sending an unsuspicious link in an email to the users, injecting the link by XSS in the web application or putting the link into an external site. It is unsuspicious, because the link starts with the URL to the web application and the URL to the malicious site is hidden in the redirection parameter: http://www.example.com/site/redirect?to= www.attacker.com. Here is an example of a legacy action:
ARTICLE
# secure_rails1.update_attribute :created_at, (rand*81).days.ago

secure_rails2 = Article.create! name: "Self-contained XSS", created_at: (rand*1).days.ago ,content: <<-ARTICLE
Another redirection and self-contained XSS attack works in Firefox and Opera by the use of the data protocol. This protocol displays its contents directly in the browser and can be anything from HTML or JavaScript to entire images:
ARTICLE


albert_einstein = Article.create! name: "Albert Einstein", created_at: (rand*21).days.ago, content: <<-ARTICLE
(14 March 1879 - 18 April 1955) was a German-born theoretical physicist. He developed the general theory of relativity,one of the two pillars of modern physics (alongside quantum mechanics).He is best known for his mass-energy equivalence formula E = mc2 (which has been dubbed 'the worlds most famous equation').He received the 1921 Nobel Prize in Physics 'for his services to theoretical physics, and especially for his discovery of the law of the photoelectric effect'.The latter was pivotal in establishing quantum theory.
ARTICLE
# albert_einstein.update_attribute :created_at, (rand*81).days.ago

maratha_empire = Article.create! name: "Maratha Empire", created_at: (rand*156).days.ago, content: <<-ARTICLE
The Maratha Empire or the Maratha Confederacy was an Indian imperial power that existed from 1674 to 1818. At its peak, the empire covered much of the subcontinent, encompassing a territory of over 2.8 million km. The Marathas are partially credited with ending the Mughal rule in India.
ARTICLE
# maratha_empire.update_attribute :created_at, (rand*221).days.ago

yamaha_corporation = Article.create! name: "Yamaha Corporation", created_at: (rand*201).days.ago,content: <<-ARTICLE
Yamaha Corporation is a Japanese multinational corporation and conglomerate based in Japan with a very wide range of products and services, predominantly musical instruments, electronics, motorcycles and power sports equipment.
ARTICLE
# yamaha_corporation.update_attribute :created_at, (rand*123).days.ago


git_basics = Article.create! name: "2.1 Git Basics - Getting a Git Repository", created_at: (rand*421).days.ago,content: <<-ARTICLE
Getting a Git Repository You can get a Git project using two main approaches. The first takes an existing project or directory and imports it into Git. The second clones an existing Git repository from another server.
ARTICLE
# git_basics.update_attribute :created_at, (rand*173).days.ago


# sunspot_basics = Article.create! name: "Ordering and pagination", content: <<-ARTICLE
# GettSunspot allows ordering on one or more non-text fields using the order_by method in the search DSL (if no order_by call is made, results are sorted by relevancy). order_by may be called more than once, and the earlier calls will have higher ordering precedence than the later calls. Each call to the method should take the field name and either :asc or :desc:
# ARTICLE
# sunspot_basics.update_attribute :created_at, (rand*173).days.ago

[Event, Photo].each(&:delete_all)

Event.create! name: "Capture the Joker", starts_at: 2.days.from_now, ends_at: 3.days.from_now, description: "The Joker is at it again. Find his secret lair and capture him to keep him from causing more trouble."

Event.create! name: "Save the World", starts_at: 2.weeks.from_now, ends_at: 3.weeks.from_now, description: "An astroid is expected to collide with Earth around this time. It's a bird, it's a plain, it's Superman!"

Photo.create! name: "The Dark Knight Rises", filename: "dark_knight_rises.jpg"
Photo.create! name: "Superman", filename: "superman.jpg"


# VintHub: Project Documentation
Borrow Timeless Style

## 🌍 Project overview
Relove the past with **VintHub!** Have a passion for fashion, but on a budget? Discover unique vintage pieces or rent out your own items.

- 🎯 **The goal:** Create a AirBnB clone with a twist!
- 🛠 **Tech-stack:** Ruby on Rails, JavaScript, HTML, CSS
- 🛠 **Tools:** Git, PostgreSQL
‍
- 📆 **Dates:** May 2025
- 📆 **Duration:** 1 week sprint

---

### The pitch

**The problem:**
I have been invited to a Rockabilly themed party but I have nothing to wear! And I'm on a budget.

**The solution:**
My fairy godmother VintHub is here to save my cinderella day! 
I can rent out a whole Rockabilly outfit for the weekend, and put my dress up to rent to make a bit of extra cash for the party!

**The target audience:**
- Demographic: 20-60 year old vintage lovers. 
- People who love the style and elegance of the past but have a limited budget.
- Users who love variety but hate fast fashion. 

**The features:**
- Rent out items or put your own up for rent.
- Search based on title, description, category, brand and size.
- Manage your bookings in 'My wardrobe'.

---

## 🚧 Challenges

### What did we struggle with?

**1. Data types**
- **Challenge**: Assigning the correct data type to each column in the models.
- **Solution**: Created a DB schema to map out the back-end and assigned data types which we confirmed with a TA before coding.

**2. Validations**
- **Challenge**: One of the biggest challenges was adding all the necessary validations for the bookings model, to ensure users could not create an invalid booking.
- **Solution**: To solve this problem I added validations to the dates to format them correctly and to check the booking is in the future. I also validated and formatted the duration and price. Lastly, I stopped users booking an item that was already rented out.

**3. Seeding**
- **Challenge**: Lack of free vintage API.
- **Solution**: Overcame seeding-related challenges and lack of vintage API by using faker and sourced vintage images and renamed them to extact name on the product to be able to link them.

**4. Time and people management**
- **Challenge**: This was our first group project with only one week in which to complete it.
- **Solution**: To collaborate in an agile work environment we created a KanBan board using Github projects. This helped us to keep track of the progress of the project and make a plan for everyone that maximised efficiency and prioritised urgent tasks. 

---

## 🏆 Accomplishments

### What did we learn?

**✅Technical Skills:**
- Ruby models, controllers and routing
- HTML for views to build structure of the webpages
- Git version control and code reviewing practices
- Accessibility implementation best practices
- Responsive design

**✅Design Skills:**
- SCSS stlying using partials, nesting and chaining
- Creating inclusive user experiences
- Balancing information density with usability
- Building trust through transparent design
- Color theory and contrast for accessibility

**✅Problem-Solving:**
- Used DB schema to visualise the back-end structure
- Breaking down large problems into actionable solutions
- Prioritizing features for maximum impact

---

## 💡 Planning

**User story:**
We mapped out the key user journeys and the purpose behind each step. We prioritised them as we were working to a tight deadline. Next we selected the path, verb, controller and action for each step to help us set up the back-end. Lastly, we assigned each step to team members, according to their interests and skillsets.

**DB schema:**
We planned the DB schema for the website, getting feedback from my team members and TA. This helped us visualise the back-end structure and ensure each model table contained the correct columns. The biggest challenge was assigning the correct data type to each column.

**UX/UI prototype:**
Before diving into coding, we created a mock-up of our final design for our key user journey in Figma, utilising their components feature. We created the homepage, groups, calendar, event generation, categories, adventures partials, adventures info, poll notification, poll selector, votes viewer, event info, notifications, and group chat pages. 

**Kanban board and slack channel:**
To collaborate in an agile work environment we created a KanBan board using Github projects. This helped us to visualise the tasks that needed to be completed and keep track of the progress of the project during our morning stand-up and make a plan for everyone for the coming day that maximised efficiency and prioritised urgent tasks. We also used a dedicated slack channel for communications throughout the project.

---

## 🔧 Building the back-end

**Models, Associations and Validations:**
Next we created the models, based off the DB schema. Worked in pair-programming with Marianna reviewing. We used Devise to setup the user model. The biggest  challenge was adding all the necessary validations for the bookings model, to ensure users could not create an invalid booking. To solve this problem we added validations to the dates to format them correctly and to check the booking is in the future. We also validated and formatted the duration and price. Lastly, we stopped users booking an item that was already rented out.

**Controllers, Actions and Views:**
We created the base controllers, actions and views. We aimed to work with tasks as features, following the feature flow from route, to controller action, to corresponding view. So we could explore the full-stack development life-cycle from back-end to front-end. 

**Partials:**
We refractored the initial HTML into partials for code that was reusable, such as index and show cards. This helped us organise our code to improve readability by seperating components into manageable elements, and enabled us to update it and apply tailored SCSS later on.

**New booking form:**
To create the new booking form, we split it into a partial and rendered it in the new.html.erb file using simple_form_for. We created a datepicker controller using flatpickr.js to give users the option of adding the date on a calendar.

**Search feature:**
To allow users to search through the vintage items based on title, description, category, brand and size. We used the pg_search gem to build named scopes that utilise PostgreSQL's full text search.

**Delete feature:**
Added delete feature to bookings and items a user has posted with a notification and redirect to the bookings index page.

---

## 🎨 Styling the front-end

**SCSS:**
- Using the partials and classes we created in the HTML, we linked corresponding tailored SCSS stylesheets.
- For example; We added box-shadow and border-radius to cards to make them stand out from the back-ground. 
- We used flexbox to arrange and align the image and content within the cards to ensure responsive layouts.
- We changed the colour and styling of the CTA buttons so they stand out but still fit into the colour scheme.
- To ensure my code is clean, organised and easy to read we utilised SCSS partials, nesting and chaining.

---

## 🚀 Future plans

As this was a two week sprint we had to prioritse the key user journey, below is a list of features I would like to add in the future to improve the user experience:
- Filter or group items by category, brand or size on the items index page.
- Create drop down menu for form inputs - category, size, brand.
- Add time period column to items (e.g. 1950s).
- Add price if not returned column to items, and explain procedure to users.

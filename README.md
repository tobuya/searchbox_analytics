<a name="readme-top"></a>
[![Contributors](https://img.shields.io/github/contributors/tobuya/rails-template)](https://github.com/tobuya/rails-template/graphs/contributors)
[![LastUpdate](https://img.shields.io/github/last-commit/tobuya/rails-template)](https://github.com/tobuya/rails-template/commits/main)
[![Stargazers](https://img.shields.io/github/stars/tobuya/rails-template)](https://github.com/tobuya/rails-template/stargazers)
[![Issues](https://img.shields.io/github/issues/tobuya/rails-template)](https://github.com/tobuya/rails-template/issues)
[![License](https://img.shields.io/github/license/tobuya/rails-template)](https://github.com/tobuya/rails-template/blob/main/LICENSE)

<details>
<summary>Table of Contents</summary>

- [Rails Template](#-rails-template)
  - [🧰 Tech Stack  ](#-tech-stack--)
  - [✨ Key Features  ](#-key-features--)
  - [📘 Getting Started  ](#-getting-started--)
    - [📋 Prerequisites](#-prerequisites)
    - [📂 Setup](#-setup)
    - [📥 Installation](#-installation)
    - [💾 Database](#-database)
    - [💻 Usage](#-usage)
    - [🧪 Run tests](#-run-tests)
  - [👨‍🚀 Authors  ](#-authors--)
  - [🎯 Future Features  ](#-future-features--)
  - [🤝 Contribution  ](#-contribution--)
  - [💖 Show Your Support  ](#-show-your-support--)
  - [🙏 Acknowledgements](#-acknowledgements)
  - [📜 License ](#-license-)
</details>

# Rails and PostgreSQL Template

This is a template for creating Ruby on Rails applications with PostgreSQL as the chosen database. It provides a starting point for building robust web applications using the Rails framework and leveraging the power and reliability of PostgreSQL for data storage.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🧰 Tech Stack  <a name="tech-stack"></a>
- Ruby on Rails
- PostgreSQL

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ✨ Key Features  <a name="key-features"></a>
- *Ruby on Rails:* The template is preconfigured with Ruby on Rails, a popular web application framework that follows the MVC (Model-View-Controller) architecture. Rails provides a rich set of features and conventions to streamline development and increase productivity.

- *PostgreSQL Database:* PostgreSQL is a robust, open-source relational database management system known for its performance, scalability, and support for advanced SQL features. The template is set up to utilize PostgreSQL as the default database, allowing you to take advantage of its powerful capabilities.

- *Easy Setup:* The template comes with a ready-to-use Rails application structure and the necessary configuration for PostgreSQL. You can quickly get started by cloning this repository and customizing it to suit your specific project requirements.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📘 Getting Started  <a name="getting-started"></a>

To run this project locally, you'll need to follow these steps.

### 📋 Prerequisites

Make sure you have the following installed on your machine:
- [Ruby 3.2.2 or higher](https://www.ruby-lang.org/en/)
- [Rails 7.0.4 or higher](https://rubyonrails.org/)
- [PostgreSQL 15.2 or higher](https://www.postgresql.org/)

### 📂 Setup

Clone this repository to your desired folder.

```sh
cd my-project
git clone git@github.com:tobuya/rails-template.git
```

### 📥 Installation

Install the required gems with:

```sh
bundle install
```

### 💾 Database


Configure the database connection
- Open `config/database.yml` file and ensure that the database configuration matches your PostgreSQL setup by updating the `username`, `password`, and other relevant settings in the `default` section to match your PostgreSQL configuration.
- Also, update the `development`, `test`, and `production` sections to match your project configuration.

Create the database by running the following command:

```sh
rails db:create
```

*At this point, Ruby on Rails application with a PostgreSQL database is customized and can be modified to one's liking by adding models, controllers and other components to build their desired system*

To run the migrations:
```sh
rails db:migrate
```

To load the sample data, run:

```sh
rails db:seed
```

### 💻 Usage

To run the development server, execute the following command:

```sh
rails server
```

### 🧪 Run tests

To run tests, run the following command:

```sh
rspec spec --format doc

rubocop -A
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👨‍🚀 Authors  <a name="author"></a>

👤 **Thomas Obuya**

- [GitHub](https://github.com/tobuya)
- [Medium](https://medium.com/@tobuya)
- [LinkedIn](https://linkedin.com/in/tobuya)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🎯 Future Features  <a name="future-features"></a>

- [ ] Features suggested from the Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contribution  <a name="contribution"></a>

Contributions, issues, and feature requests are welcome! If you have any improvements, bug fixes, or additional features that you'd like to contribute, feel free to submit a pull request. Together, we can enhance this template and make it even more valuable for Rails and PostgreSQL developers.

Feel free to check the [issues page](https://github.com/tobuya/hello-rails-back-end/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💖 Show Your Support  <a name="support"></a>

If you like this project, please consider giving it a ⭐.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgements

I would like to acknowledge anyone who would like to contribute to this project. Feel free to customize the template further, adding your own models, controllers, and other components to build your desired application

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📜 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
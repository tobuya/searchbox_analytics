<a name="readme-top"></a>
[![Contributors](https://img.shields.io/github/contributors/tobuya/searchbox_analytics)](https://github.com/tobuya/searchbox_analytics/graphs/contributors)
[![LastUpdate](https://img.shields.io/github/last-commit/tobuya/searchbox_analytics)](https://github.com/tobuya/searchbox_analytics/commits/main)
[![Stargazers](https://img.shields.io/github/stars/tobuya/searchbox_analytics)](https://github.com/tobuya/searchbox_analytics/stargazers)
[![Issues](https://img.shields.io/github/issues/tobuya/searchbox_analytics)](https://github.com/tobuya/searchbox_analytics/issues)
[![License](https://img.shields.io/github/license/tobuya/searchbox_analytics)](https://github.com/tobuya/searchbox_analytics/blob/main/LICENSE)

<details>
<summary>Table of Contents</summary>

- [Real-Time Search Analytics](#real-time-search-analytics)
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
  - [🎯 Analytics  ](#-analytics--)
  - [How it Works ](#how-it-works-)
  - [🤝 Contributions  ](#-contributions--)
  - [💖 Show Your Support  ](#-show-your-support--)
  - [🙏 Acknowledgements](#-acknowledgements)
  - [📜 License ](#-license-)
</details>

# Real-Time Search Analytics

This Rails application provides a real-time search experience for users exploring articles and offers analytics to understand user search trends.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🧰 Tech Stack  <a name="tech-stack"></a>

- Ruby on Rails
- PostgreSQL
- Vanilla JS
- CSS

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ✨ Key Features  <a name="key-features"></a>

- *Real-time Search:* Users receive search suggestions and confirmation as they type their queries.
- *Search Term Analytics:* Track what users are searching for and identify popular trends.
- *IP-based Search Logging:* Record user searches without requiring user accounts (Devise not required).
- *Action Cable Integration:* Enables real-time communication for search updates.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📘 Getting Started  <a name="getting-started"></a>

To run this project locally, you'll need to follow these steps.

### 📋 Prerequisites

Make sure you have the following installed on your machine:
- [Ruby 3.2.2 or higher](https://www.ruby-lang.org/en/)
- [Rails 7.0.6 or higher](https://rubyonrails.org/)
- [PostgreSQL 16.2 or higher](https://www.postgresql.org/)

### 📂 Setup

Clone this repository to your desired folder.

```sh
cd my_desired_folder
git clone git@github.com:tobuya/searchbox_analytics.git
cd searchbox_analytics
```

### 📥 Installation

Install the required gems with:

```sh
bundle install
```

### 💾 Database

Configure the database connection
- Open `config/database.yml` file and ensure that the database configuration matches your PostgreSQL setup by updating the `username`, and `password`.

Create the database by running the following command:

```sh
rails db:create
```

To run the migrations:

```sh
rails db:migrate
```

To load the sample data, run:

```sh
rails db:seed
```

*Note:* This application uses Webpack for JavaScript management. Ensure you have Node.js and npm installed for Webpack to function properly.

### 💻 Usage

To run the development server, execute the following command:

```sh
rails server
```

### 🧪 Run tests

To run tests, run the following command:

```sh
rspec spec --format doc
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 👨‍🚀 Authors  <a name="author"></a>

👤 **Thomas Obuya**

- [GitHub](https://github.com/tobuya)
- [Medium](https://medium.com/@tobuya)
- [LinkedIn](https://linkedin.com/in/tobuya)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🎯 Analytics  <a name="analytics"></a>

This application currently focuses on recording user search data. Future development will involve implementing functionalities to visualize search analytics and user trends. This might include displaying:

- [ ] Top most searched terms over a specific timeframe.
- [ ] Charts or graphs to represent search trends visually.
- [ ] Ability to filter search data by time period or other criteria.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## How it Works <a name="how-it-works"></a>

The application utilizes a Trie data structure for efficient search suggestions. As users type, the Trie helps find matching prefixes for the search term, providing real-time suggestions.

User searches are logged based on IP addresses without requiring user accounts. This allows for basic search tracking without user authentication complexities.

Action Cable is used to enable real-time communication between the server and client. When a user submits a search or receives a suggestion, data is exchanged using Action Cable for an interactive experience.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributions  <a name="contribution"></a>

Contributions, issues, and feature requests are welcome! If you have any improvements or suggestions, feel free to create a pull request.

Feel free to check the [issues page](https://github.com/tobuya/searchbox_analytics/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💖 Show Your Support  <a name="support"></a>

If you like this project, please consider giving it a ⭐.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgements

I would like to acknowledge Mr. Emil Hajric for giving me an opportunity and clear instructions on how to work on this project.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📜 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
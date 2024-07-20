# Multi-Tenant Application Demo

## Description

This project demonstrates a multi-tenant setup in Ruby on Rails using Rails multi-database architecture. It showcases how to implement multi-tenancy in both the main application and background jobs using Sidekiq.

The purpose of this project is to serve as a tutorial and practical example for developers looking to implement multi-tenancy in their Rails applications.

## Features

- Multi-tenant setup using Rails multi-database architecture
- Sidekiq integration for background job processing
- Multi-tenancy support in Sidekiq jobs
- Demonstration of separate databases for different tenants

## Screenshots

### Tenant 1 (App1 Database)
[Insert screenshot of app1.localhost connected to app1 db]

### Tenant 2 (App2 Database)
[Insert screenshot of app2.localhost connected to app2 db]

## Getting Started

### Prerequisites

- Ruby [2.7.7+]
- Rails [6.0.1+]
- Mayql or Postgres

### Installation

1. Clone the repository:
```
git clone https://github.com/yourusername/multi-tenant-application.git
```
2. Navigate to the project directory:
```
cd multi-tenant-application
```
3. Install dependencies:
```
bundle install
```
4. Set up the databases:
```
rails db:create
rails db:migrate
```
5. nginx setup
```
Copy nginx.conf to your nginx conf file
```

6. Start the Rails server:
```
gem install foreman
foreman start
```
## Usage
Navigate to app1.localhost & app2.localhost

## Architecture Overview

This application demonstrates a multi-tenant architecture where:

1. Each tenant has its own database
2. The application dynamically connects to the appropriate database based on the tenant
3. Background jobs (using Sidekiq) maintain tenant context

[You might want to add a simple diagram here illustrating the architecture]

## Learn More

For a deeper dive into the concepts and implementation details, check out these blog posts:

1. [Mastering Multi-Tenant Setup with Rails - Part 1](https://www.elitmus.com/blog/technology/mastering-multi-tenant-setup-with-rails-part-1/)
2. [Mastering Multi-Tenant Setup with Rails: Background Jobs](https://www.elitmus.com/blog/technology/mastering-multi-tenant-setup-with-rails-background-jobs/)

These articles provide step-by-step explanations of the multi-tenant setup process and how to handle background jobs in a multi-tenant environment.

## Contributing

Contributions to improve the project or extend its capabilities are welcome. Please feel free to submit pull requests or open issues for discussion.


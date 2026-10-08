# Tasks for Today Management System

A CodeIgniter 4 task dashboard for the IT0049 Technical Summative Assessment. It has a filtered Welcome page, a complete Task List, a one-user Profile page, and a static About page.

## Pages

- `/` shows tasks whose `task_date` is today.
- `/tasks` shows every task, ordered by date.
- `/profile` shows the single demo user.
- `/about` identifies the developer.

## Requirements

- PHP 8.1 or newer with the MySQLi extension enabled
- Composer
- MySQL or MariaDB (XAMPP is suitable for local development)
- CodeIgniter 4 appstarter

## Set up the application

This repository contains the application source files, database migration, seeder, SQL export, and a Windows PowerShell setup script. The script creates a standard CodeIgniter base in a separate folder and copies the application files into it.

1. In VS Code, open this folder and choose **Terminal → New Terminal**.
2. Run `powershell -ExecutionPolicy Bypass -File .\setup.ps1`. This creates a sibling folder named `tasks-today-management-system-app` with the CodeIgniter base and these app files merged together.
3. In phpMyAdmin, create a database named `tasks_today_db`. The generated `.env` already uses this name; update its MySQL username/password if your local settings differ.
4. In the terminal, move into the generated app folder with `cd ..\tasks-today-management-system-app`.
5. Run `php spark migrate` and then `php spark db:seed TasksTodaySeeder`.
6. Start the application with `php spark serve` and open `http://localhost:8080/`.

The alternative is to import `sql/tasks_today.sql` into MySQL instead of running the migration and seeder. Do not use both methods on the same database unless you drop the tables first.

## Test the pages

Open `/`, `/tasks`, `/profile`, and `/about`. The Welcome page should show today's seeded tasks. The Task List should show at least eight tasks across multiple dates, and the Profile page should show one demo user.

## Data and time zone

The seeder generates sample task dates relative to the date it runs, so it always creates tasks for today and for other days. The included SQL export uses MySQL date functions for the same reason. The application uses the PHP server's current date/time zone for its "today" filter; set the PHP/CodeIgniter server time zone to the same local zone used for seeding when deploying.

## Database export

The repository includes both `sql/tasks_today.sql` and CodeIgniter migration/seeder files. The SQL file creates the exact `tasks` and `users` table structure specified in the assessment and inserts eight tasks plus one demo user.

## GitHub submission

After the application has been created and tested, create an empty public GitHub repository named `tasks-today-management-system` under the `johneinstein23` account. In a terminal opened in the generated `tasks-today-management-system-app` folder, run:

```powershell
git init -b main
git add .
git commit -m "Build Tasks for Today Management System"
git remote add origin https://github.com/johneinstein23/tasks-today-management-system.git
git push -u origin main
```

The `.gitignore` file excludes `.env` and `vendor`; the committed `composer.json` and `composer.lock` let the host install dependencies. Never commit database passwords.

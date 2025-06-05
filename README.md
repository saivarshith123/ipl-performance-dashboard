# 🏏 IPL Performance Analytics Dashboard (2008–2022) using Power BI & PostgreSQL

This project is a Power BI dashboard built using IPL data from the 2008 to 2022 seasons. It provides comprehensive insights into team and player performances, key match stats, and season-wise analytics. Inspired by **RCB's long-awaited IPL 2025 victory**, this dashboard celebrates cricket through data.

## 📌 Project Overview

The dashboard delivers data-driven insights on:

- 🏆 Title Winners (Season-wise)
- 🟧 Orange Cap (Most Runs)
- 🟪 Purple Cap (Most Wickets)
- 💣 Total Sixes and Fours
- 🏏 Batsman and Bowler Stats (with filter options)
- 🧠 Toss Decision vs. Match Result Analysis
- 🏟️ Match Wins by Venue
- 📅 Match Wins by Result Type
- 📊 Team-wise Wins by Season

## 🛠️ Tools & Technologies

- **Database:** PostgreSQL
- **Visualization Tool:** Power BI
- **Language/Query:** DAX, SQL

## 🗃️ Data Sources

- `ipl_matches_2008_2022`: Match-level data  
- `ipl_ball_by_ball_2008_2022`: Ball-by-ball event data

## 🔄 Process Flow

1. **Data Import & Cleaning** (via Power Query)
2. **Data Modelling** (relationships between tables)
3. **Time Intelligence Functions** (seasonal filters)
4. **DAX Measures & KPIs**
5. **Interactive Dashboard Visualizations**
6. **Insights & Storytelling**

## 📸 Dashboard Snapshot

![preview](https://github.com/user-attachments/assets/4e17ff30-09ab-4100-81ad-7b8196ded627)


> *Note: Dashboard was built to support filters across seasons and players for flexible analysis.*

## 🎯 Key Learnings

- How to connect Power BI to PostgreSQL
- Time intelligence with DAX
- Data cleaning and shaping in Power Query
- KPI creation and interactive filtering
- Dashboard design and formatting techniques

## 📢 Motivation

This dashboard was created as a **passion project** after **Royal Challengers Bangalore (RCB)** finally won the IPL 2025 championship — a moment worth celebrating with data!

## 🚀 Getting Started

If you're trying to replicate or explore this:

1. Restore the provided SQL tables (`ipl_ball_by_ball_2008_2022`, `ipl_matches_2008_2022`) into PostgreSQL
2. Open the Power BI file (`.pbix`) and connect it to your PostgreSQL instance
3. Refresh data and explore the visuals

## 📬 Contact

For questions, feedback, or collaboration, feel free to reach out!

## 👤 **Moulya**  

📧 *saivarshith1085@gmail.com*

## 📌 License

This project is for educational and non-commercial use only.

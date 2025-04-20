
# 📺 Netflix Data Platform Project

This project demonstrates an end-to-end data engineering pipeline for a Netflix-like application using **dbt**, **BigQuery**, and **modular data modeling** principles. It follows a layered architecture to organize data across raw, staging, marts, and product layers.

---
## 🏗️ Project Structure
```
├── .github/workflow
├── models/
│   ├── raw/
│   ├── staging/
│   └── marts/
├── seeds/
│   ├── users.csv
│   ├── profiles.csv
│   ├── contents.csv
│   ├── genres.csv
│   ├── content_genre.csv
│   ├── devices.csv
│   └── viewing_sessions.csv
├── snapshots/
├── tests/
├── dbt_project.yml
└── README.md
```
---

## 🧱 Layers

### 🔹 RAW Layer (Seeded from CSVs)
- `users`, `profiles`, `contents`, `genres`, `content_genre`, `devices`, `viewing_sessions`

### 🔸 STAGING Layer
- Cleaned and renamed tables using `ref()` to map raw tables
- Examples: `stg_users`, `stg_profiles`, `stg_contents`, `stg_viewing_sessions`

### 🟩 MARTS Layer
- **Dimensions**: `dim_users`, `dim_profiles`, `dim_contents`
- **Facts**: `fact_viewing_sessions`

---

## 📊 Data Flow

1. **Seed** raw CSV data into BigQuery via `dbt seed`
2. **Transform** with staging models (`dbt run --select staging`)
3. **Build analytics-ready tables** in marts (`dbt run --select marts`)
4. Optional: Add **tests**, **docs**, and **snapshots**

---

---

## ⚙️ CI/CD: GitHub Actions Workflow for dbt + BigQuery
This project uses GitHub Actions to automate testing and validation of dbt models on every commit or pull request to main or dev branches.

---

## 🔄 Workflow Triggers
1. On push to main or dev

2. On pull requests to main

3. Manual dispatch (workflow_dispatch)

## 📋 Key Steps in Workflow:
1. Checks out the repo

2. Sets up Python and installs dbt-bigquery

3. Authenticates to GCP using Workload Identity Federation

4. Writes the profiles.yml on-the-fly with secrets

5. Runs dbt deps, dbt debug, and dbt test

## 🚀 How to Run

```bash
# Install dependencies
dbt deps

# Seed the raw data
dbt seed

# Run staging + marts
dbt run

# Test your models
dbt test

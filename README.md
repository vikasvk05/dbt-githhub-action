
# 📺 Netflix Data Platform Project

This project demonstrates an end-to-end data engineering pipeline for a Netflix-like application using **dbt**, **BigQuery**, and **modular data modeling** principles. It follows a layered architecture to organize data across raw, staging, marts, and product layers.

---

## 🏗️ Project Structure
├── data/ │ 
└── seeds/ │ 
    ├── users.csv │ 
    ├── profiles.csv │ 
    ├── contents.csv │ 
    ├── genres.csv │ 
    ├── content_genre.csv │ 
    ├── devices.csv │ 
    └── viewing_sessions.csv 
├── models/ │ 
    ├── raw/ │ 
    ├── staging/ │ 
    └── marts/ 
    ├── snapshots/ 
    ├── tests/ 
├── dbt_project.yml 
├── README.md 


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



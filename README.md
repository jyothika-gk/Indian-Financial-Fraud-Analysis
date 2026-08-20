# 🛡️ Indian Financial Fraud Analysis Dashboard


## 📌 Project Overview

This project analyzes **250,000 financial transactions** from Indian banking data to identify fraud patterns, high-risk merchant categories, and transaction behaviors. The analysis was performed using **Excel, SQL, and Power BI**.

---

## 🎯 Objectives

- Identify fraud patterns across payment methods, channels, and states
- Analyze international vs domestic fraud rates
- Find top fraud reasons and high-risk merchant categories
- Build an interactive dashboard for business insights

---

## 🗂️ Dataset

**Source:** [Kaggle — Indian Financial Fraud Dataset](https://www.kaggle.com/datasets/jatinkhandelwal112/indian-financial-fraud-dataset)

| File | Description | Rows |
|------|-------------|------|
| Transaction_Data_250k.csv | All transaction records | 2,50,000 |
| Customer_data.csv | Customer details | 25,000 |
| Cards_Data.csv | Card information | 32,457 |
| merchant_table.csv | Merchant details | 500 |

---

## 🛠️ Tools Used

| Tool | Purpose |
|------|---------|
| Microsoft Excel | Data cleaning and exploration |
| MySQL Workbench | Data import and SQL analysis |
| Power BI | Interactive dashboard |

---

## 🧹 Data Cleaning (Excel)

- No missing values found in any of the 4 tables
- No duplicate rows detected
- Added `Fraud_Label` column: 0 → "Not Fraud", 1 → "Fraud"
- Added `International_Label` column: 0 → "Domestic", 1 → "International"
- Fixed date and time column formats

---

## 📊 Key Findings

### 💳 Overall Fraud Stats
| Metric | Value |
|--------|-------|
| Total Transactions | 2,50,000 |
| Total Fraud Cases | 13,473 |
| Fraud Rate | 5.39% |
| Avg Fraud Amount | ₹78,097 |
| Avg Normal Amount | ₹13,105 |

### 🌍 International vs Domestic
| Type | Fraud Count | Fraud Rate |
|------|-------------|------------|
| Domestic | 10,997 | 4.63% |
| International | 2,476 | **19.69%** |

> ⚠️ International transactions have **4x higher fraud rate** than domestic

### 💳 Fraud by Payment Method
| Payment Method | Fraud Count |
|----------------|-------------|
| Debit Card | 6,803 |
| Credit Card | 4,862 |
| UPI | 1,476 |
| Net Banking | 332 |

### 🏪 Top 5 Fraud Merchant Categories
| Category | Fraud Count |
|----------|-------------|
| Hotel | 1,143 |
| Fuel | 1,062 |
| Travel | 1,062 |
| Fashion | 1,014 |
| Airline | 992 |

### 📍 Top 5 States by Fraud
| State | Fraud Count |
|-------|-------------|
| Uttar Pradesh | 1,016 |
| Telangana | 972 |
| Gujarat | 946 |
| Kerala | 933 |
| Haryana | 921 |

### ⚠️ Top Fraud Reasons
| Reason | Count |
|--------|-------|
| Transaction Attempt on Expired Card | 2,500 |
| High Risk Merchant Category Spike | 1,800 |
| Unusual Cross-Border Transaction | 1,700 |
| Unusual High Transaction Amount | 1,700 |
| Rapid Velocity & Multiple Failed Attempts | 1,700 |

---

## 📈 Dashboard Features

- **5 KPI Cards** — Total Transactions, Total Amount, Avg Amount, Fraud Count, Total Customers
- **4 Interactive Slicers** — Date, Customer Segment, Transaction Type, Merchant Category
- **Fraud Amount Trend** — Monthly line chart
- **International vs Domestic** — Donut chart
- **Fraud by Merchant Category** — Top 8 bar chart
- **Fraud by State** — Top 5 bar chart
- **Fraud by Reasons** — Top 5 bar chart

---

## 💡 Key Insights

1. 🌍 **International fraud rate is 4x higher** — 19.69% vs 4.63% domestic
2. 💰 **Fraud transactions are 6x higher in amount** — ₹78K vs ₹13K
3. 💳 **Debit card has highest fraud volume** — 6,803 cases
4. 🏨 **Hotel & Fuel are highest risk merchant categories**
5. 📍 **Kerala ranks 4th highest fraud state** in India
6. ⚠️ **Expired card transactions** are the #1 fraud reason

---

## 📁 Project Structure

```
Indian-financial-fraud-analysis/
├── data/
│   ├── Transaction_Data_250k.csv
│   ├── Customer_data.csv
│   ├── Cards_Data.csv
│   └── merchant_table.csv
├── dashboard/
│   └── Banking_Analytics_Dashboard.pbix
├── dashboard.png
└── README.md
```

---

## 👩‍💻 Author

**Jyothika G K**
- 📍 Kasargod, Kerala
- 🎓 BA Development Economics, St. Pius X College, Kannur University
- 💼 Fresher Data Analyst


---

## 🏷️ Tags
`Data Analysis` `Power BI` `SQL` `Excel` `Fraud Detection` `Banking Analytics` `India`

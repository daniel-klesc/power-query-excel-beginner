# 📅 Module 8: Working with Dates and Time

## 🎯 Learning Objectives
By the end of this module, learners will:
- Extract useful date components (year, month, day, weekday)
- Group and filter data based on time periods
- Create a custom column for month names or seasons
- Analyze trends over time (e.g., monthly sales, seasonal patterns)

---

## 🧠 Concepts Introduced

- Date transformations:
  - Extract **Year, Month, Day, Weekday**
  - Format dates as text (e.g., `"Jan 2024"`)
- Creating new columns for:
  - Time-based grouping (Month/Quarter/Season)
  - Flags like "Is Weekend" or "Is Peak Season"
- Using date-based columns for analysis and dashboard filtering

---

## 🏢 Scenario Context: Krkoš Seasonality & Trends

Krkoš wants to understand how sales change over time:

- Do specific products peak in winter or summer?
- How do weekdays compare to weekends?
- Are certain months consistently underperforming?
- Are seasonal discounts helping?

Your job is to enrich the sales data with date-based insights to enable trend analysis.

---

## 🛠️ Common Date Functions in Power Query

| Function                        | Example Use             |
|---------------------------------|--------------------------|
| `Date.Year([Date])`             | Extract year             |
| `Date.Month([Date])`            | Extract month (1–12)     |
| `Date.MonthName([Date])`        | Full month name          |
| `Date.QuarterOfYear([Date])`    | Extract quarter          |
| `Date.DayOfWeekName([Date])`    | Weekday name             |
| `Date.DayOfWeek([Date])`        | Weekday number (0=Sun)   |

---

## 🧪 Exercise: Add Time Intelligence Columns

**Input:** Combined monthly sales (from Module 6 or 7)

### Tasks:
1. Add columns:
   - `Year`
   - `Month` (as number)
   - `Month Name` (e.g., January)
   - `Quarter`
   - `Weekday`
   - `Is Weekend` (if weekday = Saturday/Sunday)

2. Create a new column: `Season`  
   - Example rule (adjustable):
     - Dec, Jan, Feb = Winter
     - Mar, Apr, May = Spring
     - Jun, Jul, Aug = Summer
     - Sep, Oct, Nov = Autumn

---

## 💡 Pro Tips

- Use date columns for building trend charts or period comparisons
- Consider loading a **calendar table** in advanced scenarios
- Format date columns clearly for end users (e.g., `Jan 2024`)

---

## ✅ Outcomes

- Learner can enrich datasets with time-based dimensions
- Enables deeper analysis of trends, peaks, and seasonal patterns
- Prepares data for final reporting and visualization in Module 9

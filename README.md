# Decline in Student Engagement on the Course

## Business context

1️⃣ **Business background**

An international EdTech company operates an 8-week online Data Analytics Bootcamp. The course follows an upfront payment model: students pay before the start. Early dropout does not reduce initial revenue but impacts:

- LTV (no upsell to advanced tracks);
  
- NPS (unfinished experience → lower satisfaction);
  
- Brand reputation;
  
- Risk of refunds / negative churn signals;

In June 2025, a new cohort launched.

Business expectation is to maintain healthy early-stage retention. Baseline: ~ 60–70% reach Week 3 in previous cohorts.

2️⃣ **Problem statement**

Within one month, analytics detected a critical anomaly: 40% fewer students reached Week 3 vs. the average performance of earlier cohorts.

Meaning: early churn increased sharply in the new launch.

3️⃣ **Clarifying questions**

The Product Lead asks:

1) **Where** does the funnel break? (Week 1 vs Week 2 vs Week 3)

2) **Who** is affected most?

3) **Why** did this happen now? 

## Hypotheses ("Why has student dropout increased sharply in the new course cohort, and what factors are driving this decline?")

1. **Behavioral factors**

📌 Students demonstrate high initial interest but engagement drops early → identify the key churn point: after Week 1 or Week 2;

📌 Learners without a technical foundation tend to disengage faster → analyze retention across profile types (students, professionals, experienced users);

📌 There may be a small segment of users who "checked in once and never returned" → estimate the share of these short-lived participants

2. **Product factors**

📌 June cohort may have experienced a restructured curriculum or more complex onboarding → evaluate whether the steep fall happens right at the start of the program;

📌 Lower levels of mentor communication or feedback could reduce persistence → assess how mentor activity levels correlate with retention;

📌 Lack of motivational triggers (e.g., reminders, gamification) might impact consistency → compare engagement where push/email nudges exist vs. where they don’t

3. **Technical factors**

📌 Possible issues with the platform or tracking system: some interactions may not have been captured → look for unusual drops to zero in activity data;

📌 Access-related friction (system login errors, account issues) could block progress → measure how many users never initiated any activity post-registration

4. **External / Market factors**

📌 Seasonal distraction: June often means holidays, exam season, and competing priorities → check engagement dips depending on learners’ start dates;

📌 Competitor campaign spikes might attract attention away → paid-acquisition cohorts may show a sharper decline

## Data architecture: 4-Layer ETL pipeline

1) STAGING layer (includes light data cleaning (data type conversions, removal of explicit duplicates, etc.));

2) LABELED Layer (cohort assignment + weekly engagement flags);

3) COHORT RETENTION Layer (retention calculations per cohort & week);

4) MARTS Layer (final analytical view (baseline vs June + uplift/loss))

## Key findings & Insights

📌 Week 1 retention is significantly below the historical norm → onboarding / first-session friction

📌 Decline persists through Week 2–3 → not temporary (deeper product or external issue)

📌 Segment breakdown highlights non-tech backgrounds dropping the most → course may feel too advanced from the start

📌 Start dates show micro-spikes around holiday periods → seasonal distraction validated as partial contributor

Issue is specific to June cohort, not a long-term trend

## Business impact

1) Lost ~ 40 p.p. early retention;
   
3) Significant portion of students not reaching "value moment";
  
5) Lower LTV → fewer progressing to advanced programs;
   
7) Higher risk of negative reviews and refund demands

This threatens:

- Future revenue (upsell to specialization courses);

- Brand trust and word-of-mouth

## Recommendations

1) Onboarding	- add "First Day Checklist", quick-win intro lessons;

2) Motivation	- soft progression (quizzes, micro-achievements);

3) Mentorship	- increase touchpoints in Week 1–2 (1:1 messages);

4) Targeted support	- special track or guidance for non-tech learners;

5) Comms - automated push/email nudges per inactivity rules;

6) Ops - shift starts away from major holiday/time-off windows

Prioritization based on **largest impact segment** (tech-novice users)

## Monitoring & Alerts

1) Live chart: weekly retention by cohort & segment

2) Alert: week-1 retention Δ > 10 pp from baseline

3) Track "no activity after registration" rate daily

4) Cohort health dashboard: start_date breaks


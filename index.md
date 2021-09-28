## Supplementary archive for 'A global analysis of the COVID-19 policy activity levels and evolution patterns'

Meiqian Chen, Yucheng Dong, Xiaoping Shi                                                            

Correspondence to: ycdong@scu.edu.cn                                                                           

September 2021

This file offers all the replication data and code, and adds some supplementary figures and tables for 'A global analysis of the COVID-19 policy activity levels and evolution patterns'.

### **Data S1: Oxford COVID-19 Government Response Tracker (OxCGRT)**

The OxCGRT dataset is collected from public sources, such as news articles and government press releases and briefings, where information across countries and time is reported in terms of 20 indicators of government policy. Most indicators are recorded on an ordinal scale (strictness score) that represents the policy’s level of strictness. Please see the table below.

| **ID** | **Name**                              | **Description**                                              | **Ordinal scale**                                            |
| :----- | :------------------------------------ | :----------------------------------------------------------- | :----------------------------------------------------------- |
| C1     | School closing                        | Record closings of schools and universities                  | 0 - no measures; 1 - recommend closing or all schools open  with alterations resulting in significant differences compared to  non-Covid-19 operations; 2 - require closing (only some levels or  categories, e.g., just high school, or just public schools); 3 - require closing all levels; Blank - no data |
| C2     | Workplace closing                     | Record closings of workplaces                                | 0 - no measures; 1 - recommend closing (or recommend work  from home) or all businesses open with alterations resulting in significant  differences compared to non-Covid-19 operation; 2 - require closing (or work from home) for  some sectors or categories of workers; 3 - require closing (or work from home) for  all-but-essential workplaces (e.g., grocery stores, doctors); Blank - no data |
| C3     | Cancel public events                  | Record cancelling public events                              | 0 - no measures; 1 - recommend cancelling; 2 - require cancelling; Blank - no data |
| C4     | Restrictions on gatherings            | Record limits on gatherings                                  | 0 - no restrictions; 1 - restrictions on very large gatherings  (the limit is above 1000 people); 2 - restrictions on gatherings between 101–1000  people; 3 - restrictions on gatherings between 11–100  people; 4 - restrictions on gatherings of 10 people  or less; Blank - no data |
| C5     | Close public transport                | Record closing of public transport                           | 0 - no measures; 1 - recommend closing (or significantly  reduce volume/route/means of transport available); 2 - require closing (or prohibit most  citizens from using transportaion); Blank - no data |
| C6     | Stay at home requirements             | Record orders to  "shelter-in-place" and otherwise confine to the home | 0 - no measures; 1 - recommend not leaving the house; 2 - require not leaving the house with  exceptions for daily exercise, grocery shopping, and “essential” trips; 3 - require not leaving the house with  minimal exceptions (e.g., allowed to leave once a week, or only one person  can leave at a time, etc.); Blank - no data |
| C7     | Restrictions on internal   movement   | Record restrictions on internal movement  between cities/regions | 0 - no measures; 1 - recommend not to travel between  regions/cities; 2 - internal movement restrictions in place; Blank - no data |
| C8     | International travel controls         | Record restrictions on international travel                  | 0 - no restrictions; 1 - screening arrivals; 2 - quarantine arrivals from some or all  regions; 3 - ban arrivals from some regions; 4 - ban on all regions or total border  closure; Blank - no data |
| E1     | Income support                        | Record if the government is providing  direct cash payments to people who lose their jobs or cannot work. | 0 - no income support; 1 - government is replacing less than 50%  of lost salary (or if a flat sum, it is less than 50% median salary); 2 - government is replacing 50% or more of  lost salary (or if a flat sum, it is greater than 50% median salary); Blank - no data |
| E2     | Debt / Contract relief for households | Record if the government is freezing  financial obligations for households (e.g., stopping loan repayments,  preventing services like water from stopping, or banning evictions) | 0 - no debt/contract relief; 1 - narrow relief, specific to one kind of  contract; 2 - broad debt/contract relief |
| E3     | Fiscal measures                       | Announced economic stimulus spending                         | Record monetary value in  USD of fiscal stimuli, includes any spending or tax cuts NOT INCLUDE in E4,  H4 or H5. 0 - no new spending that day; Blank - no data |
| E4     | International support                 | Announced offers of COVID-19 related aid  spending to other countries | Record monetary value in USD. 0 - no new spending that day; Blank - no data |
| H1     | Public information campaigns          | Record presence of public info campaigns                     | 0 - no COVID-19 public information campaign; 1 - public officials urging caution about COVID-19; 2- coordinated public information campaign  (e.g., across traditional and social media); Blank - no data |
| H2     | Testing policy                        | Record government policy  on who has access to testing       | 0 - no testing policy; 1 - only those who both (a) have symptoms  AND (b) meet specific criteria (e.g., key workers, those admitted to hospitals,  those who came into contact with a known case, those having recently returned  from overseas); 2 - testing of anyone showing COVID-19  symptoms; 3 - open public testing (e.g., "drive  through" testing available to asymptomatic people); Blank - no data |
| H3     | Contact tracing                       | Record government policy on contact tracing  after a positive diagnosis | 0 - no contact tracing; 1 - limited contact tracing; not done for  all cases; 2 - comprehensive contact tracing; done for  all identified cases |
| H4     | Emergency investment in healthcare    | Announced short term spending on healthcare  system, e.g., hospitals, masks, etc. | Record monetary value in USD. 0 - no new spending that day; Blank - no data |
| H5     | Investment in vaccines                | Announced public spending on Covid-19  vaccine development   | Record monetary value in USD. 0 - no new spending that day; Blank - no data |
| H6     | Facial coverings                      | Record policies on the use of facial  coverings outside the home | 0 - No policy  1 - Recommended  2 - Required in some specified  shared/public spaces outside the home with other people present, or some  situations when social distancing is not possible  3 - Required in all shared/public spaces  outside the home with other people present or all situations when social  distancing is not possible  4 - Required outside the home at all times  regardless of location or presence of other people |
| H7     | Vaccination policy                    | Record  policies for vaccine delivery for different groups   | 0 - No availability  1 - Availability for ONE of following: key  workers/ clinically vulnerable groups (nonelderly) / elderly groups  2 - Availability for TWO of following: key  workers/ clinically vulnerable groups (non-elderly) / elderly groups  3 - Availability for ALL of following: key  workers/ clinically vulnerable groups (nonelderly) / elderly groups  4 - Availability for all three plus partial  additional availability (select broad groups/ages)  5 - Universal availability |
| H8     | Protection of elderly people          | Record  policies for protecting elderly people (as defined locally) in long term care  facilities and/or the community and home setting | 0 - no measures  1 - Recommended isolation, hygiene, and  visitor restriction measures in long term care facilities and/or elderly people to stay at home  2 - Narrow restrictions for isolation,  hygiene in LTCFs, some limitations on external visitors and/or restrictions protecting  elderly people at home  3 - Extensive restrictions for isolation  and hygiene in LTCFs, all non-essential external visitors prohibited, and/or  all elderly people required to stay at home and not leave the home with  minimal exceptions, and receive no external visitors  Blank - no data |

### **Table S1: All 186 countries included in OxCGRT dataset** 

Country names and ISO (Alpha-3) country codes (For more information, please see https://www.iso.org/obp/ui#search).

|             **Country  name** | **Country code** |      |   **Country  name** | **Country code** |      | **Country  name** | **Country code** |      |             **Country  name** | **Country code** |
| ----------------------------: | ---------------- | ---- | ------------------: | :--------------- | ---- | ----------------: | :--------------- | ---- | ----------------------------: | :--------------- |
|                         Aruba | ABW              |      |             Denmark | DNK              |      |              Laos | LAO              |      |                       Romania | ROU              |
|                   Afghanistan | AFG              |      | Dominican  Republic | DOM              |      |           Lebanon | LBN              |      |                        Russia | RUS              |
|                        Angola | AGO              |      |             Algeria | DZA              |      |           Liberia | LBR              |      |                        Rwanda | RWA              |
|                       Albania | ALB              |      |             Ecuador | ECU              |      |             Libya | LBY              |      |                 Saudi  Arabia | SAU              |
|                       Andorra | AND              |      |               Egypt | EGY              |      |     Liechtenstein | LIE              |      |                         Sudan | SDN              |
|         United  Arab Emirates | ARE              |      |             Eritrea | ERI              |      |        Sri  Lanka | LKA              |      |                       Senegal | SEN              |
|                     Argentina | ARG              |      |               Spain | ESP              |      |           Lesotho | LSO              |      |                     Singapore | SGP              |
|                     Australia | AUS              |      |             Estonia | EST              |      |         Lithuania | LTU              |      |              Solomon  Islands | SLB              |
|                       Austria | AUT              |      |            Ethiopia | ETH              |      |        Luxembourg | LUX              |      |                 Sierra  Leone | SLE              |
|                    Azerbaijan | AZE              |      |             Finland | FIN              |      |            Latvia | LVA              |      |                  El  Salvador | SLV              |
|                       Burundi | BDI              |      |                Fiji | FJI              |      |       China-Macao | MAC              |      |                   San  Marino | SMR              |
|                       Belgium | BEL              |      |              France | FRA              |      |           Morocco | MAR              |      |                       Somalia | SOM              |
|                         Benin | BEN              |      |     Faeroe  Islands | FRO              |      |            Monaco | MCO              |      |                        Serbia | SRB              |
|                 Burkina  Faso | BFA              |      |               Gabon | GAB              |      |           Moldova | MDA              |      |                  South  Sudan | SSD              |
|                    Bangladesh | BGD              |      |     United  Kingdom | GBR              |      |        Madagascar | MDG              |      |                      Suriname | SUR              |
|                      Bulgaria | BGR              |      |             Georgia | GEO              |      |            Mexico | MEX              |      |              Slovak  Republic | SVK              |
|                       Bahrain | BHR              |      |               Ghana | GHA              |      |              Mali | MLI              |      |                      Slovenia | SVN              |
|                       Bahamas | BHS              |      |              Guinea | GIN              |      |             Malta | MLT              |      |                        Sweden | SWE              |
|       Bosnia  and Herzegovina | BIH              |      |              Gambia | GMB              |      |           Myanmar | MMR              |      |                      Eswatini | SWZ              |
|                       Belarus | BLR              |      |              Greece | GRC              |      |          Mongolia | MNG              |      |                    Seychelles | SYC              |
|                        Belize | BLZ              |      |           Greenland | GRL              |      |        Mozambique | MOZ              |      |                         Syria | SYR              |
|                       Bermuda | BMU              |      |           Guatemala | GTM              |      |        Mauritania | MRT              |      |                          Chad | TCD              |
|                       Bolivia | BOL              |      |                Guam | GUM              |      |         Mauritius | MUS              |      |                          Togo | TGO              |
|                        Brazil | BRA              |      |              Guyana | GUY              |      |            Malawi | MWI              |      |                      Thailand | THA              |
|                      Barbados | BRB              |      |    China-Hong  Kong | HKG              |      |          Malaysia | MYS              |      |                    Tajikistan | TJK              |
|                        Brunei | BRN              |      |            Honduras | HND              |      |           Namibia | NAM              |      |                  Turkmenistan | TKM              |
|                        Bhutan | BTN              |      |             Croatia | HRV              |      |             Niger | NER              |      |                   Timor-Leste | TLS              |
|                      Botswana | BWA              |      |               Haiti | HTI              |      |           Nigeria | NGA              |      |                         Tonga | TON              |
|     Central  African Republic | CAF              |      |             Hungary | HUN              |      |         Nicaragua | NIC              |      |          Trinidad  and Tobago | TTO              |
|                        Canada | CAN              |      |           Indonesia | IDN              |      |       Netherlands | NLD              |      |                       Tunisia | TUN              |
|                   Switzerland | CHE              |      |               India | IND              |      |            Norway | NOR              |      |                        Turkey | TUR              |
|                         Chile | CHL              |      |             Ireland | IRL              |      |             Nepal | NPL              |      |                  China-Taiwan | TWN              |
|                         China | CHN              |      |                Iran | IRN              |      |      New  Zealand | NZL              |      |                      Tanzania | TZA              |
|                Cote  d'Ivoire | CIV              |      |                Iraq | IRQ              |      |              Oman | OMN              |      |                        Uganda | UGA              |
|                      Cameroon | CMR              |      |             Iceland | ISL              |      |          Pakistan | PAK              |      |                       Ukraine | UKR              |
| Democratic  Republic of Congo | COD              |      |              Israel | ISR              |      |            Panama | PAN              |      |                       Uruguay | URY              |
|                         Congo | COG              |      |               Italy | ITA              |      |              Peru | PER              |      |                United  States | USA              |
|                      Colombia | COL              |      |             Jamaica | JAM              |      |       Philippines | PHL              |      |                    Uzbekistan | UZB              |
|                       Comoros | COM              |      |              Jordan | JOR              |      | Papua  New Guinea | PNG              |      |                     Venezuela | VEN              |
|                   Cape  Verde | CPV              |      |               Japan | JPN              |      |            Poland | POL              |      | United  States Virgin Islands | VIR              |
|                   Costa  Rica | CRI              |      |          Kazakhstan | KAZ              |      |      Puerto  Rico | PRI              |      |                       Vietnam | VNM              |
|                          Cuba | CUB              |      |               Kenya | KEN              |      |          Portugal | PRT              |      |                       Vanuatu | VUT              |
|                        Cyprus | CYP              |      |    Kyrgyz  Republic | KGZ              |      |          Paraguay | PRY              |      |                         Yemen | YEM              |
|               Czech  Republic | CZE              |      |            Cambodia | KHM              |      |         Palestine | PSE              |      |                 South  Africa | ZAF              |
|                       Germany | DEU              |      |            Kiribati | KIR              |      |             Qatar | QAT              |      |                        Zambia | ZMB              |
|                      Djibouti | DJI              |      |        South  Korea | KOR              |      |            Kosovo | RKS              |      |                      Zimbabwe | ZWE              |
|                      Dominica | DMA              |      |              Kuwait | KWT              |      |                   |                  |      |                               |                  |

### **Table S2:  The selected 80 countries** 

Country names and ISO (Alpha-3) country codes (For more information, please see https://www.iso.org/obp/ui#search).

|       **Country Name** | **Country code** |      | **Country Name** | **Country code** |      | **Country Name** | **Country code** |
| ---------------------: | :--------------- | ---- | ---------------: | :--------------- | ---- | ---------------: | :--------------- |
|            Afghanistan | AFG              |      |          Georgia | GEO              |      |            Nepal | NPL              |
|              Argentina | ARG              |      |           Greece | GRC              |      |             Oman | OMN              |
|                Austria | AUT              |      |        Guatemala | GTM              |      |         Pakistan | PAK              |
|             Azerbaijan | AZE              |      |         Honduras | HND              |      |           Panama | PAN              |
|                Belgium | BEL              |      |          Croatia | HRV              |      |             Peru | PER              |
|             Bangladesh | BGD              |      |          Hungary | HUN              |      |      Philippines | PHL              |
|               Bulgaria | BGR              |      |        Indonesia | IDN              |      |           Poland | POL              |
| Bosnia and Herzegovina | BIH              |      |            India | IND              |      |         Portugal | PRT              |
|                Bolivia | BOL              |      |          Ireland | IRL              |      |         Paraguay | PRY              |
|                 Brazil | BRA              |      |             Iran | IRN              |      |          Romania | ROU              |
|                 Canada | CAN              |      |             Iraq | IRQ              |      |           Russia | RUS              |
|            Switzerland | CHE              |      |           Israel | ISR              |      |     Saudi Arabia | SAU              |
|                  Chile | CHL              |      |            Italy | ITA              |      |           Serbia | SRB              |
|                  China | CHN              |      |           Jordan | JOR              |      |  Slovak Republic | SVK              |
|               Colombia | COL              |      |            Japan | JPN              |      |         Slovenia | SVN              |
|             Costa Rica | CRI              |      |       Kazakhstan | KAZ              |      |           Sweden | SWE              |
|                   Cuba | CUB              |      |            Kenya | KEN              |      |         Thailand | THA              |
|         Czech Republic | CZE              |      |          Lebanon | LBN              |      |          Tunisia | TUN              |
|                Germany | DEU              |      |            Libya | LBY              |      |           Turkey | TUR              |
|     Dominican Republic | DOM              |      |        Sri Lanka | LKA              |      |          Ukraine | UKR              |
|                Algeria | DZA              |      |        Lithuania | LTU              |      |          Uruguay | URY              |
|                Ecuador | ECU              |      |          Morocco | MAR              |      |    United States | USA              |
|                  Egypt | EGY              |      |          Moldova | MDA              |      |        Venezuela | VEN              |
|                  Spain | ESP              |      |           Mexico | MEX              |      |          Vietnam | VNM              |
|               Ethiopia | ETH              |      |          Myanmar | MMR              |      |     South Africa | ZAF              |
|                 France | FRA              |      |         Malaysia | MYS              |      |         Zimbabwe | ZWE              |
|         United Kingdom | GBR              |      |      Netherlands | NLD              |      |                  |                  |



### **Figure S1: Plot of global policy patterns**

![Image](https://github.com/Meiqian-Chen/COVID-19.policy.github.io/blob/gh-pages/policy_patterns.pdf)

 For the selected 80 countries, the global policy patterns are evolving into seven main categories: i) Afghanistan, ii) China, iii) Iran, iv) Japan, v) Uruguay, vi) Costa Rica, Egypt, Hungary and Turkey, and vii) the remaining 71 countries. 

### **Figure S2: Testing the activity levels of government policy, new confirmed cases, and new deaths Support or Contact**

![Image](https://github.com/Meiqian-Chen/COVID-19.policy.github.io/blob/gh-pages/fig_Robustness_checks_1.png)

**(A–C)** Plots of the number of countries with significant changes (q-value < 0.05, 0.01, 0.001) in government policies with a 10-day time window, 20-day time window, and 30-day time window, respectively. **(D–F)** Plots of the number of countries with significant changes (q-value < 0.05, 0.01, 0.001) in new confirmed cases with a 10-day time window, 20-day time window, and 30-day time window, respectively. **(G–I)** Plots of the number of countries with significant changes (q-value < 0.05, 0.01, 0.001) in new deaths with a 10-day time window, 20-day time window, and 30-day time window, respectively.

### **Figure S3: Testing the activity level of the stringency index scores of government policies**

![image-20210928171045585](/Users/mqchen/Library/Application Support/typora-user-images/image-20210928171045585.png)

Plots of the number of countries with significant changes (q-value < 0.05, 0.01, 0.001) in stringency index scores of government policies with a 10-day time window **(A)**, a 20-day time window **(B)** and a 30-day time window **(C)**.

### **Figure S4: Plot of the changes of z-scores of total deaths vs. the z-scores of policy activity levels**

<img src="/Users/mqchen/Library/Application Support/typora-user-images/image-20210928170720724.png" alt="image-20210928170720724" style="zoom:50%;" />

The policy activity level in each country here is calculated based on the policy-active countries with significant changes in the government policies but no significant changes in new deaths (see SI Appendix Robustness Checks). The fitting curves in black is estimated by the linear model. 

### **Figure S5: Plot of the changes of z-scores of HDI scores vs. the z-scores of policy activity levels for 171** countries (countries with missing HDI scores were removed)**

![image-20210928180227957](/Users/mqchen/Desktop/GCS平台/COVID-19.policy.github.io/image-20210928180227957.png)

Points with the policy activity levels between -1 and 1 are marked in pink, and the rest are in blue. The fitting curve is estimated by locally estimated scatterplot smoothing. The black dotted line is the threshold for a score of 0 that indicates the global average of the HDI. The policy activity level in each country here is calculated based on the policy-active countries with significant changes in the government policies but no significant changes in new deaths (see SI Appendix Robustness Checks).

### **Figure S6: Plot of the similarities of two clustering results 7 and 15 days apart**

![image-20210928171423928](/Users/mqchen/Library/Application Support/typora-user-images/image-20210928171423928.png)

Based on the Rand index method, the green points denote the similarity between the clustering result of the cumulative strictness scores of the countries on that day and the clustering result 7 days later, and the blue points denote the similarity between the clustering result of the cumulative strictness scores of the countries on that day and the clustering result 15 days later. The fitting curve in blue and green both are estimated by the linear model.

### **Figure S7: Plots of the similarities of two clustering results 1 day, 7 days, and 15 days apart based on the different partition distance indexes**

![image-20210928171553414](/Users/mqchen/Library/Application Support/typora-user-images/image-20210928171553414.png)

The similarity between the clustering result of the cumulative strictness scores of the countries on that day and the clustering result 1 day, 7 days and 15 days later, based on the Jaccard index **(A)** and Fowlkes-Mallows index **(B)**, respectively. Both the Jaccard index and Fowlkes-Mallows index range from 0 to 1, a similarity equal to 1 means that the two clustering results are the same.

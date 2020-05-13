library(shiny)

#setwd(paste(getwd(), "/Documents/jobs/jobs2020/lebesgue-test-exercise", sep=""))
data = read.csv("~/Documents/jobs/jobs2020/lebesgue-test-exercise/data_per_province.csv")

# Use a fluid Bootstrap layout
fluidPage(    
    
    # Give the page a title
    titlePanel("Statistics Per Province"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
        
        # Define the sidebar with one input
        sidebarPanel(
            selectInput("province", "Select a province:", 
                        choices=data$province)
        ),
        
        # Create a spot for the barplot
        mainPanel(
            h1("Provinces by frequency in data and average total order price"),
            img(src="per_province.png"),
            h1(textOutput("selectedProvince")),
            plotOutput("statusPlot"),
            h2(textOutput("avg_price")),
            h2(textOutput("mode_period"))
        )
        
    )
)
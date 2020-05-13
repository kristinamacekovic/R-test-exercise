library(shiny)
library(data.table)
library(ggplot2)

#setwd(paste(getwd(), "/Documents/jobs/jobs2020/lebesgue-test-exercise", sep=""))
data = read.csv("~/Documents/jobs/jobs2020/lebesgue-test-exercise/data_per_province.csv")

# Define a server for the Shiny app
function(input, output) {
    
    # Fill in the spot we created for a plot
    
    dataInput = reactive(
        {
            transpose(subset(data, province == input$province), keep.names = "statistic")
        }
    )
    
    output$statusPlot <- renderPlot({

        # Render a barplot
        barplot(as.numeric(dataInput()$V1[3:5]),
                ylab="Percentage (out of those in province)",
                xlab="Status",
                names.arg = dataInput()$statistic[3:5],
                col="lightblue",
                border = "white"
                )
    })
    
    output$selectedProvince <- renderText({ 
        paste("Results for ", input$province, " province")
    })
    
    output$avg_price <- renderText({ 
        paste("Average subscription price in this province is ", format(round(as.numeric(dataInput()$V1[7]), 2), nsmall = 2), "$.")
    })
    
    output$mode_period <- renderText({ 
        paste("The most common subscription period is every ", dataInput()$V1[8], "months.")
    })
    
    output$table <- renderTable(dataInput())
}
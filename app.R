library(shiny)
library(car)
library(tidyr)
# Define UI for data upload app ----
ui <- fluidPage(
    # App title ----
    titlePanel("Germ Types Recognization"),
    # Sidebar layout with input and output definitions ----
    sidebarLayout(
        # Sidebar panel for inputs ----
        sidebarPanel(
            # Input: Select a file ----
            fileInput("file1", "Choose CSV File",
                      multiple = TRUE,
                      accept = c("text/csv",
                                 "text/comma-separated-values,text/plain",
                                 ".csv")),
            # Input: Select number of rows to display ----
            radioButtons("disp", "Display",
                         choices = c(Head = "head",
                                     All = "all"),
                         selected = "head"),
            radioButtons("q", "Draw (Select No before updating file)",
                         choices = c(Yes = "yes",
                                     No = "no"),
                         selected = "no"),
            checkboxGroupInput("inCheckboxGroup2", "",""),
        ),
        # Main panel for displaying outputs ----
        mainPanel(
            # Output: Data file ----
            tableOutput("contents"),
            verbatimTextOutput("info"),
            verbatimTextOutput("count"),
            plotOutput("plot1", click = "plot_click")
            )
    ),
)
# Define server logic to read selected file ----
server <- function(input, output,session) {
    output$contents <- renderTable({
        # input$file1 will be NULL initially. After the user selects
        # and uploads a file, head of that data file by default,
        # or all rows if selected, will be shown.
        req(input$file1)
        df <- read.csv(input$file1$datapath,
                       header = TRUE,
                       sep ="\t")
        if(input$disp == "head") {
            return(head(df))
        }
        else {
            return(df)
        }
    })
        output$plot1 <- renderPlot({
            req(input$file1)
          my.data <- read.csv(input$file1$datapath,
                              header = TRUE,
                              sep ="\t")
          co=seq(3,ncol(my.data)-1,2)
          new=my.data[,-co]
          data_long <- gather(new,name,value,colnames(new)[2]:colnames(new)[ncol(new)])
          gg=input$inCheckboxGroup2
          hi=data_long[data_long$name %in% gg,]
            if(input$q == "yes") {
              scatterplot(value~X|name,data=hi,smooth = FALSE, 
                          grid = FALSE, frame = FALSE,regLine=FALSE,
                          xlab="Temperature",ylab="Response",
                          legend=list(title=deparse(substitute(Groups)),
                                      inset=0.005,cex=0.8))
          }  
        })
        output$info <- renderText({
            paste0("The coordinate in the following plot\n",
                   "x=", input$plot_click$x, "\ny=", input$plot_click$y)
        })
        output$count <- renderText({
            req(input$file1)
            my.data <- read.csv(input$file1$datapath,
                           header = TRUE,
                           sep ="\t")
            i=2
            c=rep(0,(ncol(my.data))/2-1)
            if (sum(grepl("Unknown",colnames(my.data)))!=0){
            for (i in 1:((ncol(my.data))/2-1)){
                c[i]=sum(abs((my.data[,i]-my.data[,ncol(my.data)])))
                i=i+2
            }
            paste0("The unknown germ is ",colnames(my.data)[which.min(c)])
            }
            else{
                paste("There is no unknown germ!")
            }
            
        })
        observe({
            req(input$file1)
            my.data <- read.csv(input$file1$datapath,
                                header = TRUE,
                                sep ="\t")
            cel=seq(2,ncol(my.data),2)
            select=colnames(my.data)[cel]
            if (is.null(select))
                select<- character(0)
            updateCheckboxGroupInput(session,"inCheckboxGroup2",
                                     label = paste("Types of Germ (Multiple choices allowed)"),
                                     choices =select
            )
        })
}
# Create Shiny app ----
shinyApp(ui, server)
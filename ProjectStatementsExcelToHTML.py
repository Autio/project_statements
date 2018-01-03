# -*- coding: utf-8 -*-
# This translates a project statement spreadsheet into HTML and posts it into the report format
# The data comes from Project Center to the Data Warehouse and should have:
# Column B - Project
# Column C - Programme
# Column D - Country Programme
# Column G - Contact
# Column H - Project Statement
# Column I - Target funding

from openpyxl import load_workbook, Workbook
import datetime

# Import the report template .aspx file
report = open('ProjectStatementReportTemplate.aspx', 'r')
reportText = report.read()
reportParts = reportText.split('|') # splitter which has been manually inserted in the right places

wb = load_workbook('ProjectStatements.xlsm')
output = ""

r = 2

while True:
    sheet = wb['Report']
    if sheet['A' + str(r)].value == None:
        break

    country, programme, project, contact, targetFunding, statement = "", "", "", "", "", ""
    try:
        country = sheet['D' + str(r)].value
        if country == None:
            country = "No country"
    except:
        print('no country found')
    try:
        programme = sheet['C' + str(r)].value
        if programme == None:
            programme = "No programme"
    except:
        print('no programme found')
    try:
        project = sheet['B' + str(r)].value
        if project == None:
            project = "No project"
    except:
        print('no project found')
    try:
        contact = sheet['G' + str(r)].value
        if contact == None:
            contact = "No contact"
    except:
        print('no contact found')
    try:
        targetFunding = sheet['I' + str(r)].value
        if targetFunding == None:
            targetFunding = "target funding unknown"
        else:
            targetFunding = "target funding: " + targetFunding
    except:
        print('no statement found')
    try:
        statement = sheet['H' + str(r)].value
        if statement == None:
            statement = "No statement"
    except:
        print('no statement found')

    title = str(country) + " - " + str(programme) + " - " + str(project) + " - " + str(contact) + " - " + str(targetFunding)
    body = statement

    ## Output ##
    section = "<button class=\"accordion\">" + title + "</button> <div class=\"panel\"><p>"+body + "</p></div>"
    output += section

    r += 1

output = output.replace("_x000D_", " ")
print(output)

todayDate = datetime.datetime.today().strftime('%Y-%m-%d')

reportOutput = reportParts[0] + todayDate  + reportParts[1] + output + reportParts[2]
print(reportOutput)

oFile = open('Project Statements.aspx', 'wb')
oFile.write(reportOutput.encode('utf-8'))
oFile.close()

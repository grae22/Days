# Functions ===================================================================

function RenderMainMenu()
{
    Write-Host "--- Days ---`n"
    Write-Host "1. Add entry"
    Write-Host "0. Exit`n"
}

function DoMainMenu()
{
    do
    {
        Clear-Host
        RenderMainMenu

        $input = Read-Host -Prompt 'Choose an option'

        switch ($input)
        {
            '1'
            {
                DoAddEntry
            }

            '0'
            {
                return
            }
        }
    }
    while ($true)
}

function DoAddEntry()
{
    Clear-Host
    Write-Host "--- Add Entry ---`n"
    
    $name = GetTrimmedInput 'Name'

    if ($name.Length -eq 0)
    {
        return
    }
    
    $rating = GetInputNumberInRange 'Rating (1=V.Bad, 2=Bad, 3=Poor, 4=Avg, 5=Ok, 6=Good, 7=V.Good, 0=Cancel)' (0..7)

    if ($rating -eq 0)
    {
        return
    }

    $date = GetInputDate 'Date'

    Write-Host "'nName: $name Rating: $rating Date: $date"
    Read-host -Prompt "'nContinue"
}

function GetNonEmptyInput([string]$prompt)
{
    do
    {
        $input = Read-Host -Prompt $prompt

        if ($input.Length -gt 0)
        {
            return $input
        }
    }
    while ($true)
}

function GetTrimmedInput([string]$prompt)
{
    return (Read-Host -Prompt $prompt).Trim()
}

function GetInputNumberInRange([string]$prompt, [int[]]$range)
{
    while ($true)
    {
        $input = GetTrimmedInput $prompt
        $inputAsInt = 0
        
        if ([System.Int32]::TryParse($input, [ref] $inputAsInt) -and $range.Contains($inputAsInt))
        {
            return $inputAsInt
        }
    }    
}

function GetInputDate([string]$prompt)
{
    while ($true)
    {
        $input = Read-Host -Prompt $prompt
        $inputAsDate = [System.DateTime]'2019-1-1'

        if ([System.DateTime]::TryParse($input, [ref]$inputAsDate))
        {
            return $inputAsDate
        }
    }
}

# Logic =======================================================================

DoMainMenu

Write-Host "`nBye."
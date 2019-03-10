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
                Exit
            }
        }
    }
    while ($true)
}

function DoAddEntry()
{
    Clear-Host
    Write-Host "--- Add Entry ---`n"
    
    $name = Read-Host -Prompt 'Name'
}

# Logic =======================================================================

DoMainMenu
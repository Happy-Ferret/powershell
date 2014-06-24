#Google search from within Powershell. Uses Firefox to display the actual page. 
#For a Youtube search add -yt as an additional flag following the search keyword. 
#Option flag -ld searches for file on connected harddrive(s).

$String=[system.console]::ReadLine()
$Flag1 = "-yt"
$Flag2 = "-ld"

if ( ($String.EndsWith($Flag1)))
{ 
$String = $String.Replace("-yt", "")
Firefox https://www.youtube.com/results?search_query=$String
}

Elseif ( ($String.EndsWith($Flag2))) 
{
$String = $String.Replace("-ld", "")
GCI -Path C:\ -Filter $String -Recurse
}

Else 
{
Firefox https://www.google.com/search?q=$String
}
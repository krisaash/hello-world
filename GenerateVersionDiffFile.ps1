function GetGitRepositoryDiff ($branch1, $branch2)
{
    $OFS = "`r`n"
    $log = git log release/1..release/2
    $html = [regex]::matches($log, "Test-\d*", 'MultiLine, IgnoreCase') | % { $_.Value } | sort -Unique
    #$html = "<div><ul>" +$html +"</ul></div>"
    $html = "" +$html

	return $html
}

$content = GetGitRepositoryDiff 'release/1' 'release/2'

echo $content

New-Item ./diff.txt -type file -force -value $content 
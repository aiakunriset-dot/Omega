<#
.SYNOPSIS
    Scan Omega for markdown files containing Indonesian text.
.DESCRIPTION
    Reports files that likely need translation.
    Heuristic: presence of common Indonesian words.
#>

$Root = "C:\Omega"
$OutputFile = "$Root\_logs\language-scan-$(Get-Date -Format 'yyyy-MM-dd').txt"

# Common Indonesian words that don't appear in English markdown
$IndonesianMarkers = @(
    '\bdan\b', '\byang\b', '\bdengan\b', '\buntuk\b', '\bdari\b',
    '\bke\b', '\bdi\b', '\bpada\b', '\badalah\b', '\bakan\b',
    '\btidak\b', '\bbisa\b', '\bharus\b', '\bwajib\b', '\b jika\b',
    '\bkarena\b', '\bsetelah\b', '\bsebelum\b', '\bselama\b',
    '\btujuan\b', '\baturan\b', '\bproses\b', '\bcatatan\b',
    '\bproyek\b', '\btahap\b', '\bmanusia\b', '\bpersetujuan\b'
)

$Pattern = ($IndonesianMarkers -join '|')

$Files = Get-ChildItem -Path $Root -Recurse -Filter "*.md" -File |
    Where-Object {
        $_.FullName -notmatch '\\_backups\\' -and
        $_.FullName -notmatch '\\_migrations\\' -and
        $_.FullName -notmatch '\\_logs\\'
    }

$Results = @()
foreach ($f in $Files) {
    if ($f.FullName -match '\\_skills\\language-normalize\\') {
        continue
    }

    $content = Get-Content $f.FullName -Raw
    # Scan prose only; code blocks are explicitly excluded by the skill rules.
    $content = [regex]::Replace($content, '(?s)```.*?```', '')
    $matches = [regex]::Matches($content, $Pattern, 'IgnoreCase')
    if ($matches.Count -gt 0) {
        $Results += [PSCustomObject]@{
            Path = $f.FullName.Replace($Root, '')
            Matches = $matches.Count
            Size = $f.Length
        }
    }
}

$Results | Sort-Object Matches -Descending | Format-Table -AutoSize

Write-Host ""
Write-Host "Total files needing normalization: $($Results.Count)" -ForegroundColor Yellow
Write-Host "Report saved to: $OutputFile" -ForegroundColor Gray

$Results | Out-File -FilePath $OutputFile -Encoding utf8
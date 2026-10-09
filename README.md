```{=html}
<!--
GA3 README template.
- Add your answers to each question's section below.
- For each question where we want you to add your commands,
  put the command(s) you ran in the terminal in the corresponding ```bash code block.
- Where we want to see a command's output, there is a plain ``` code block
  right below the command block: paste the output there.
- You don't need to paste the contents of your scripts into this file:
  we will look at the scripts in your `scripts` dir directly
  (so make sure you commit them!).
- Delete instructional comments like this one as you go.
-->
```

# GA3 answers - Chandrima Das

------------------------------------------------------------------------

## Part A: Your README, data, and Git repo

### 1: Create subdirs and copy files

<!-- No command/output needed -- you can make dirs however you want, and the copy commands are provided. -->

### 2: Initialize a Git repository, and commit the README and `.gitignore`

<!-- No command/output needed here -- we check the repo directly. -->

### 3: Commit throughout the assignment

<!-- No command/output needed here -- we check your commit history directly. -->

------------------------------------------------------------------------

## Part B: Basic shell scripts

### 4: Predict the output of `echo.sh`

<!-- No need to paste the script: we'll look at scripts/echo.sh directly. -->

*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08`):

*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08 Oct09 Oct10`):

*Answer* (prediction and reasoning for `bash scripts/echo.sh Oct07 Oct08 "Oct09 Oct10"`):

*Answer* (prediction and reasoning for `bash scripts/echo.sh results/fastqc/*.html`):

### 5: Run `echo.sh` and compare with your predictions

```{bash}
bash scripts/echo.sh Oct07 Oct08
```

### **Prediction1:** It will print `Oct07` `Oct07`and `Oct08`, then stop with an error because no third argument was provided, so `$3` is unbound. Because of the settings, `Finished` will not be printed.

The output of the command was:

```         
bash scripts/echo.sh Oct07 Oct08 Oct09 Oct10Oct07
Oct08
scripts/echo.sh: line 6: $3: unbound variable
```

``` bash
bash scripts/echo.sh Oct07 Oct08 Oct09 Oct10
```

### **Prediction2:** It will print `Oct07`, `Oct08`, and `Oct09`, followed by `Finished`. `Oct10` becomes `$4`, but in the script we did not use `$4`, so it has no effect.

The output of the command was:

```         
Oct07
Oct08
Oct09
Finished
```

``` bash
bash scripts/echo.sh Oct07 Oct08 "Oct09 Oct10"
```

### **Prediction3:** It will print `Oct07`, `Oct08`, `Oct09 Oct10`, and then `Finished`. The double quotes make `Oct09 Oct10` one argument, so the entire quoted string is assigned to `$3`.

The output of the command was:

```         
Oct07
Oct08
Oct09 Oct10
Finished
```

``` bash
bash scripts/echo.sh results/fastqc/*.html
```

### **Prediction4:** The `*.html` glob will be expanded by the shell into all matching HTML files in `results/fastqc`. These file names will be passed to the script as separate arguments. The script will print the first three matching HTML file paths and then `Finished` Any additional matching files will be ignored because the script only uses `$1`, `$2`, and `$3`.

The output of the command was:

```         
results/fastqc/S63_R1_fastqc.html
results/fastqc/S63_R2_fastqc.html
results/fastqc/S64_R1_fastqc.html
Finished
```

*Answer*: Which output (if any) differed from your prediction, and why?

### 5. None of the outputs differed from my predictions surprisingly. I am happy.

The first command stopped because `$3` was not provided and `set-euo` treats an unset variable as an error. The second command ignored the fourth argument because the script only uses `$1`, `$2`, and `$3`.

### 6: Write the `printline.sh` script

<!-- No need to paste the script: we'll look at scripts/printline.sh directly. -->

### 7: Test `printline.sh` twice

Test 1:

``` bash
# Your command:
bash scripts/printline.sh data/metadata.tsv 2
```

The output of the command was:

```         
S82     10dpi   cathemerium
```

Test 2 (with redirection), and checking the contents of the output file:

``` bash
# Your command:
bash scripts/printline.sh data/metadata.tsv 5 > results/metadata_line5.txt
cat results/metadata_line5.txt
```

The output of the command that checks the file contents was:

```         
S83     10dpi   cathemerium
```

------------------------------------------------------------------------

## Part C: A script to run MultiQC

### 8: Get a MultiQC container link

*Answer*: The container link (URI) is: [oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20](oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20)

### 9: MultiQC's help info, and the MultiQC command

Code to run `multiqc --help` with the container:

``` bash
# Your command:
apptainer exec oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20 multiqc --help
```

<!-- You don't need to paste the MultiQC help output -->

The MultiQC command to run MultiQC on `results/fastqc` with output in `results/multiqc`:

``` bash
# Your command:
apptainer exec oras://community.wave.seqera.io/library/multiqc:1.35--562c547b518ebe20 \
    multiqc --outdir results/multiqc results/fastqc
```

### 10: Write the `multiqc.sh` script

<!-- No need to paste the script: we'll look at scripts/multiqc.sh directly. -->

### 11: Run `multiqc.sh`

Code to run the script:

``` bash
# Your command:
bash scripts/multiqc.sh
```

<!-- You don't need to paste the MultiQC logging output -->

*Answer*: Number of FastQC reports MultiQC found: 44 reports

*Answer*: Does that match what you expected? Why/why not?

```         
This matched my expectation because the results/fastqc directory contained 88 FastQC output files, with two files (.html and .zip) for each FastQC analysis.
```

### 12: Make `multiqc.sh` accept arguments, and rerun it

<!-- No need to paste the script: we'll look at scripts/multiqc.sh and its Git history directly. -->

Code to rerun the script:

``` bash
# Your command:
bash scripts/multiqc.sh results/fastqc results/multiqc
```

<!-- No need to paste any output -->

### 13: Differences between the two MultiQC runs

*Answer*:

The second MultiQC run was mostly the same as the first one. In both runs, MultiQC found 44 FastQC reports. However, the output file names were different. In the first run, MultiQC created `multiqc_report_1.html` and `multiqc_data_1`, while in the second run it created `multiqc_report_2.html` and `multiqc_data_1_2`.

------------------------------------------------------------------------

## Part D: Pandoc to render Markdown

### 14: The structure of the Pandoc command

*Answer* (options and arguments, and what each does):

`pandoc` is the command. The `-o` option specifies the output file, and `README.pdf` is the argument to that option. `README.md` is the input file that Pandoc will render.

*Answer* (how does Pandoc know which output format to produce?):

Pandoc knows to produce PDF output from the `.pdf` extension of the output filename.

### 15: Render your README to PDF and HTML

``` bash
pandoc -o README.pdf README.md
```

-   Command to render to HTML:

``` bash
# Your command:
pandoc -o README.html README.md
```

### 16: Should the rendered files be committed?

*Answer*: Should the rendered files be committed to your Git repo? Why/why not?

I would not commit the rendered `README.pdf` and `README.html` files because they are generated from `README.md` and can be recreated whenever needed using Pandoc.

### 17: Install the PDF Viewer extension and view the PDF

*Answer*: One observation about the rendered PDF file:

I noticed that one of the long MultiQC commands extended beyond the right margin of the PDF and was partially cut off. I had not noticed this problem in the Markdown editor. Breaking long commands across multiple lines makes the rendered PDF easier to read.

## Part E: Publish your repo on GitHub

### 18: Create a GitHub repository

<!-- No command/output needed here -- we check your GitHub repo directly. -->

### 19: Connect your local repo to GitHub, and push

<!-- No command/output needed here -- we check your GitHub repo directly. -->

### 20: Create an Issue to tag the instructors

<!-- No command/output needed here -- we check your GitHub repo directly. -->

------------------------------------------------------------------------

## Bonus

### 21: Explore the MultiQC report

*Answer* (one insight you gained):

*Answer* (one thing you're confused about):

### 22: Pandoc versions

``` bash
# Your command:
```

The output of the command(s) was:

```         
```

*Answer*: Is the Pandoc version available by default the most recent one?

*Answer*: Which Pandoc version are you using after loading the module?

<img width="857" alt="batuque" src="https://github.com/letisbezerra/batuque/assets/88676508/737d97ab-e300-49b4-9126-37e7116130ac">


# Batuque

This tool is designed to generate lists of batuqueiros for Maracatu's performances, taking into account the proportion and priority of instruments based on a database of batuqueiros, also generating inspiring quotes according to the chosen theme. By entering the quantity of batuqueiros, it generates a list and adds different quotes within the availability of themes. It's possible to create, read, update and delete the registered batuqueiros. You can also consult the available themes.
###### Authors: Leticia Bezerra and Paulo Henrique

## Usage
### Batuque 
- Shows the command's help and the list of subcommands and options
```bash
batuque help
```
### Recruit
- Defines the number of batuqueiros between 10 and 50 and create a propotional list considering the instrument's priority
```bash
batuque recruit -l <number of batuqueiros you need>
```
### Create
- Creates a new batuqueiro in the list 
```bash
batuque create "<First and last name of batuqueiro>" "<name of instrument>" 
```
### Read
- Prints the list of batuqueiros
```bash
batuque read
```
### Update
- Updates a batuqueiro data in the list
```bash
batuque update <batuqueiro's position in the list> "<batuqueiro's new name>" "<batuqueiro's new instrument>"
```
### Delete
- Deletes batuqueiro's data in the list 
```bash
batuque delete <batuqueiro's position in the list>
```
### Quote
- Generates a quote according to a subject
```bash
batuque quote generate -s <subject>
```
### Themes
- Prints the registered list of subjects
```bash
batuque quote themes
```

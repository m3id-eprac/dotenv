let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

let g:sandwich#recipes +=
            \ [
                \{'buns':['(',')'],
                \'kind':['add','replace'],
                \'action':['add'],
                \'input':['j']}
                \]
let g:sandwich#recipes +=
            \ [
                \{'buns':['(',')'],
                \'action':['delete'],
                \'input':['j']}
                \]
let g:sandwich#recipes +=
            \ [
                \{'buns':['{','}'],
                \'kind':['add','replace'],
                \'action':['add'],
                \'input':['k']}
                \]
let g:sandwich#recipes +=
            \ [
                \{'buns':['{','}'],
                \'action':['delete'],
                \'input':['k']}
                \]
let g:sandwich#recipes +=
            \ [
                \{'buns':['[',']'],
                \'kind':['add','replace'],
                \'action':['add'],
                \'input':['l']}
                \]
let g:sandwich#recipes +=
            \ [
                \{'buns':['[',']'],
                \'action':['delete'],
                \'input':['l']}
                \]
let g:sandwich#recipes +=
            \ [
                \{'buns':["'","'"],
                \'kind':['add','replace'],
                \'action':['add'],
                \'input':[';']}
                \]
let g:sandwich#recipes +=
            \ [
                \{'buns':["'","'"],
                \'action':['delete'],
                \'input':[';']}
                \]
let g:sandwich#recipes +=
            \ [
                \{'buns':['"','"'],
                \'kind':['add','replace'],
                \'action':['add'],
                \'input':["'"]}
                \]
let g:sandwich#recipes +=
            \ [
                \{'buns':['"','"'],
                \'action':['delete'],
                \'input':["'"]}
                \]

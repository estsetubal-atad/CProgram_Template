# C Program Template

Este é um *modelo* de programa em C adaptado para:

* GCC, GDB, MAKE, VALGRING e DOXYGEN
* IDE VSCode

Ao utilizar este modelo, evita criar toda a estrutura de projeto de raiz e inclui desde já o módulo `input` para leitura de dados do utilizador.

> [!IMPORTANT]
> Todos os procedimentos abaixo descritos estão descritos na [página da UC no YouTube](https://www.youtube.com/@estsetubal-atad).
> É importante que consulte os vídeos disponibilizados.

## Clonagem ou Download de ZIP

> [!TIP]
> Clique no botão verde `<> Code` na página deste repositório GitHub e encontrará a informação ou opção necessárias para os passos descritos em seguida.

### Clonagem

Se tiver o `git` instalado, pode optar pela *clonagem* do repositório. O endereço do repositório está disponível através do botão `<> Code`.

Na consola, execute:

```console
$> git clone https://github.com/estsetubal-atad/CProgram_Template.git <program-dir-name>
```

onde `<program-dir-name>` é o novo nome do diretório que será criado contendo o código clonado. De seguida, deverá abrir este diretório no *VS Code* como a sua *working directory*. A forma mais simples é simplesmente:

```console
$> code <program-dir-name>
```

A partir do *VS Code* pode abrir um *terminal integrado*: Menu **Terminal > New Terminal**.

#### Exemplo completo

```console
$> git clone https://github.com/estsetubal-atad/CProgram_Template.git MyOwnCProgram
$> code MyOwnCProgram
```

### Download de ZIP

Utilizando a opção disponível através do botão `<> Code`, descarregue o *zip* para o seu computador e extraia o arquivo. Em seguida, clique com o botão direito sobre a pasta que contém os ficheiros fonte e escolha a opção "Abrir com Code".

## Compilação e execução

Edite o `makefile` sempre que adicionar novos módulos. Para compilar o programa, escreva no terminal:

```console
$> make
```

Se não tiver alterado o nome do *executável* (por omissão, `prog`), então para executar o programa escreva no terminal:

```console
$> ./prog
```

## Utilização do valgrind

O *Valgrind* é muito útil para detetar "memory leaks" caso o seu programa utilize *alocação dinâmica de memória*. Deve compilar o programa com símbolos de *debug* e depois executar o programa através do `valgrind`:

```console
$> make debug
$> valgrind --leak-check=full ./prog 
```

Em alternativa, pode utilizar o *script bash* já incluído no modelo:

```console
$> make debug
$> bash mem_check.sh
```

**Quando o programa termina**, será apresentada informação sobre eventuais memory leaks.

## Depuração

No separador **Run** (lado esquerdo) deverá ver um ícone verde de execução ▶️ no topo junto a "gdb - Debug project". Clique nele para iniciar a depuração. Não se esqueça de definir os seus *breakpoints*.

## Geração de documentação

Deverá ter o `doxygen` instalado e seguir o formato de documentação do doxygen. Já é fornecido um `Doxyfile` adequado à linguagem C. Utilize:

```bash
$> doxygen Doxyfile
```

e será criada uma pasta `html` contendo a documentação gerada.

## Módulo Input

Este projeto modelo inclui o módulo `input`. Deve utilizá-lo para *entrada de dados do utilizador*, pois disponibiliza um mecanismo relativamente robusto para ler dados mistos e efetuar validação - em detrimento de `scanf`.

Segue-se um programa de exemplo que demonstra a utilização deste módulo/biblioteca:

```cpp
#include <stdio.h> 
#include <stdlib.h>
#include <string.h>
#include "input.h"

int main() {
    
	/* simple data formats with validation examples */
	int value = 0;
	do {
		printf("Integer Value? ");
	} while(!readInteger(&value)); /* loops while invalid */
		
	printf("Integer Value [OK] = %d \n", value);

	double value2 = 0;
	do {
		printf("Double Value? ");
	} while(!readDouble(&value2)); /* loops while invalid */
		
	printf("Double Value [OK] = %lf \n", value2);

	/* Strings are consumed as-is */
	char text[100];
	printf("Text? ");
	readString(text, 100);
	printf("Text = %s \n", text);

	/* Example of the spliting function; use with CSV files later */
	char line[100] = "Bruno Silva;bruno.silva@estsetubal.ips.pt;;2025/26";

	char** tokens = splitString(line, 4, ";");
	for(int i=0; i<4; i++) {
		printf("Token[%d] = %s \n", i, strlen(tokens[i]) > 0 ? tokens[i] : "(empty)");
	}

	free(tokens); 

	return EXIT_SUCCESS;
}
```

e um exemplo de sessão de *interação com o utilizador*:

```markdown
Integer Value? 12d
Integer Value? - 3
Integer Value? -3
Integer Value [OK] = -3 
Double Value? 12.4.5
Double Value? -3.14159
Double Value [OK] = -3.141590 
Text? This some text and a number 7 
Text = This some text and a number 7 
Token[0] = Bruno Silva 
Token[1] = bruno.silva@estsetubal.ips.pt 
Token[2] = (empty)
Token[3] = 2025/26
```

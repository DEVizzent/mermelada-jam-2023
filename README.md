# mermelada-jam-2023
Repositorio para desarrollar un juego en la Mermelada Jam 2023
[https://itch.io/jam/mermelada-jam](https://itch.io/jam/mermelada-jam)
## Requisitos:
Para poder interactuar con el repositorio necetitas:
	- Tener git instalado
	- Tener tu cuenta de github [configurada en tu git](https://docs.github.com/en/get-started/quickstart/set-up-git#setting-up-git). `Recomiendo configurarlo con SSH`

## Descarga el repositorio:
``` git clone git@github.com:DEVizzent/mermelada-jam-2023.git ```

## Workflow:
	
Trabajaremos principalmente con 2 ramas `main` y `devel`

Todos los cambios que vayamos aportando los entregaremos a `devel`. Cada vez que logremos un hito o tengamos algo stable, llevaremos los cambios de `devel` a `main`.

Como nos movemos entre ramas:
	``` git checkout [nombreDeRama] ```

Como actualizamos nuestra rama con los cambios que han hecho nuestres compañeres:
	``` git pull origin [nombreDeRama en la que estoy] --rebase ```
> **_IMPORTANTE:_**  Es fundamental estar actualizado tanto como podamos para evitar conflictos en los cambios que realicemos.

Una vez estamos en la rama `devel` podemos empezar a trabajar. Tan pronto tengamos un cambio funcional es recomendable entregarlo. 
> **_IMPORTANTE:_**  Hacer entregas pequeñas nos permitirá mantenernos actualizados y evitar conflictos.

### Proceso de entrega

1. Ver los cambios que hemos realizado

Para obtener un listado de los ficheros que hemos modificado haremos:
	``` git status ```
Si queremos ver los cambios concretos dentro de los ficheros:
	``` git diff ```
Si queremos ver los cambios concretos dentro de un fichero concreto:
	``` git diff [path/relativa/del/fichero] ```

2. Añadir los ficheros que queremos entregar
Para añadir un fichero a nuestra siguiente entrega:
	```git add [path/relativa/del/fichero] ```
Para eliminar un cambio de la siguiente entrega(pero no de nuestro ordenador):
	```git restore --staged [path/relativa/del/fichero] ```
Podemos usar `git status` para ver que ficheros hemos añadido y cuales no. Al igual que podemos usar `git diff --staged` para ver las lineas añadidas y `git diff` para las no añadidas.

3. Entregar los cambios
Antes de entregar es recomendable comprovar que vamos a entregar con `git status`

Para la entrega podemos ejectutar:
	``` git commit ```
Y aparecera un pantalla donde deberemos escribir un mensaje que describa lo mejor posible los cambios que estamos entregando. Si queremos agilizar el proceso podemos hacer:
	``` git commit -m 'Mensaje describiendo los cambios realizados en esta entrega' ```
	
4. Distribuir los cambios
Al realizar el commit esos cambios siguen estando solo en tu ordenador, para hacer que estos lleguen al servidor de GitHub debemos ejecutar:
	``` git push origin [devel/o la rama en la que me encuentre] ```
Si nos salta un error diciendo:
	```
	! [rejected]         master -> master (non-fast-forward)
error: failed to push some refs to 'https://github.com/REDACTED.git'
hint: Updates were rejected because the tip of your current branch is behind
hint: its remote counterpart. Integrate the remote changes (e.g.
hint: 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```
Se debe a que nuestres compañeres han entregado cambios que nosotres aun no tenemos. Asi que deberemos descargarlos antes de poder entregar
`` git pull origin [nombreDeRama en la que estoy] --rebase ```
Ahora ,si no hay ningun conflicto, podremos entregar los cambios:
	``` git push origin [devel/o la rama en la que me encuentre] ```
	
### Conflictos
Que pasa si los cambios que he hecho entran en conflicto con los de mis compañeres?
Nada solo necesitaremos una mergetool, yo recomiendo [KDiff3](https://kdiff3.sourceforge.net/)
Una vez tenemos la tool instalada la podemos configurar en git con :
	```git config --global merge.tool kdiff3 ```
Y cuando tengamos conflictos ejecutaremos:
	```git mergetool ``` 
Con ello nuestra herramienta se abrira mostrando los 4 versiones del codigo:
	1. Lo que habia antes de que nadie tocase nada
	2. Lo que nuestres compañeres modificaron
	3. Lo que nosotres modificamos
	4. (Esta es editable) La version final que queremos, donde solucionamos el conflicto.
Con esto podremos ver como era el codigo antes, y las dos modificaciones que se le hicieron. Asi podremos estrujarnos los sesos para definir que se queda y que se va.
Tras resolver el conflicto podemos añadir los cambios, entregarlos y distribuirlos.

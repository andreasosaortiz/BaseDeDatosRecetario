# BaseDeDatosRecetario
Trabajo Práctico Integrador - Base de Datos 1 - UNLaM (Español)
Resumen: Simulación de Inteligencia artificial para llevar un control en la cocina, ideal para las personas que disponen de poco tiempo y requieren automatización. Esta IA permite: Guardar recetas vistas en Redes sociales o cargar las propias personalizadas, Entre sus funciones, se puede visualizar las recetas y marcas favoritas, lista de compras necesarias para las mismas y stock actual, reporte de ingredientes consumidos y de costos, historiales de menúes, entre otros.

Enunciado completo: Modelo de aplicación “Recetario Influencer” para facilitar la alimentación de cada familia y que pueda comunicarse con las principales redes sociales como Instagram, TikTok y YouTube. La idea es que en base a los influencers que una persona sigue en las redes mencionadas, la aplicación se integra con un módulo de IA (Inteligencia Artificial) que a partir de reels, videos, historias y publicaciones extraiga recetas de diversa índole.

Principalmente permite organizar y planificar las comidas y compras de las familias. Cada sigue cuentas o influencers en las redes sociales, y la aplicación los incluye en su lista de seguidores.

De los influencers nos interesa su cuenta, la red social y su nombre. Las fuentes de recetas pueden ser videos, publicaciones, reels, historias, etc.

Una receta consta de una lista de ingredientes y una preparación. Además, la cantidad de porciones que se obtienen (si se informa), nivel, tipo de cocción, tipo (vegana, sin TACC, omnívora, etc.) y tiempo de preparación. Cada ingrediente tiene el nombre, la cantidad, el nombre comercial, la marca y la alternativa. La preparación es un conjunto ordenado de pasos, donde en cada paso intervienen los ingredientes y acciones a realizar con ellos. Por ejemplo: “Batir los huevos e incorporar la esencia de vainilla y la harina”. También se guarda el vídeo de la preparación para que el usuario la vea embebida directa desde la app o abra el enlace a la fuente real. El puede completar datos faltantes en la receta, y agregar comentarios de usuario.

El arma tantos menús como quiera, con fecha desde y hasta usuario e incluye todas las recetas que quiera. También se puede reutilizar, tiene una frecuencia (semanal, diaria, quincenal, etc.) y la cantidad de comensales por comida. La aplicación marca cuáles son los menús actuales en base a la fecha.

Una comida es un conjunto de recetas, posee cantidad de comensales y su edad, el tipo de comida (desayuno, almuerzo, etc.). Por ello, en cada menú puede haber 1 o muchas comidas. Se crea una lista de compra por menú, con todos los productos o ingredientes con su cantidad necesaria para llevar a cabo las recetas y el usuario tiene la posibilidad de incluir marca, foto y nombre comercial del producto, así como el precio, aunque el módulo. de IA ya sugiere una opción conforme va aprendiendo de las elecciones del usuario.

A medida que la persona va comprando los artículos de una lista de compras, va marcándolos como marcados o listos.

Del módulo de IA sólo hace falta nombre de registrador, url, algoritmo principal y código.

El siguiente modelo deberá permitir además, resolver las cuestiones: • Cuánto cuestan los menús, las comidas y las recetas. • Buscar recetas en base a ingredientes, tipo de cocción, nivel (fácil, tranquilo, experto, etc.) y tiempo que lleva prepararlas. • Saber cuáles son las recetas preferidas por la familia. • En porcentaje, cuánto nutre cada cuenta o influencer a cada familia que usa la aplicación. • El ranking del aporte de las cuentas por tipo de comida.

Se formula la respuesta a las siguientes consultas:

i. ¿Cuáles son mis listas de compras activas? ii. El historial de los menúes que fui armando. III. Mis recetas favoritas, es decir, las que más elijo. IV. Informe de ingredientes por tipo de comida del último mes. v. Reporte de costo por menú del mes en curso, con la posibilidad de ingresar el factor inflacionario para poder conocer el presupuesto para el mes que viene. vi. Conocer mis marcas favoritas, es decir, las que más compro. vii. ¿En qué lapso del año (mes, semana, período de tiempo) prepararé todas las recetas de algún influencer? viii. ¿Cuáles son las recetas más utilizadas en los menúes del último año? IX. ¿Cuántas comidas por semana se preparan en promedio? X. ¿Cuál es el costo por comensal en promedio, en un mes?

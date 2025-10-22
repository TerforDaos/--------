import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Движущаяся кнопка',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Движущаяся кнопка со счетчиком'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    // Инициализация анимационного контроллера
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Создание анимации смещения
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -0.1), // Кнопка перемещается вверх на 10% высоты
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut, // Эластичный эффект
    ));
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    // Запуск анимации
    _animationController.reset();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.deepPurple, size: 30),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Меню открыто')),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.deepPurple, size: 30),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Настройки открыты')),
                    );
                  },
                ),
              ],
            ),
          ),


          const SizedBox(height: 40),


          Image.network(
            'https://habrastorage.org/getpro/habr/upload_files/347/bc4/240/347bc424029e258318de6c8ab17c9052.png',
            height: 120,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 30),
          Image.network(
            'https://habrastorage.org/getpro/habr/upload_files/347/bc4/240/347bc424029e258318de6c8ab17c9052.png',
            height: 120,
            fit: BoxFit.contain,
          ),


          const SizedBox(height: 60),


          const Text(
            'Вы нажали на кнопку столько раз:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
          ),


          const SizedBox(height: 40),
          Column(children: [
            Row(children: [Container(child: Text('a')),Container(child: Text('a'))],),
            Row(children: [Container(child: Text('a')),Container(child: Text('a'))],)
          ],),

          SlideTransition(
            position: _offsetAnimation,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: 150 + (_counter % 5) * 5,
              child: ElevatedButton(
                onPressed: _incrementCounter,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  shadowColor: Colors.deepPurple.withOpacity(0.5),
                ),
                child: const Text(
                  'Нажми меня!',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),


          const SizedBox(height: 20),
          const Text(
            'Кнопка подпрыгнет при нажатии',
            style: TextStyle(fontSize: 14, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
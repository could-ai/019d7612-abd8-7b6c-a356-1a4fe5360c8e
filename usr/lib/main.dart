import 'package:flutter/material.dart';

void main() {
  runApp(const BioethanolApp());
}

class BioethanolApp extends StatelessWidget {
  const BioethanolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bioethanol Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          primary: Colors.orange.shade800,
          secondary: Colors.green.shade600,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bioethanol Project',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange.shade50, Colors.white],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Icon(Icons.science, size: 80, color: Colors.orange),
                  SizedBox(height: 16),
                  Text(
                    'Making Bioethanol\nfrom Orange Juice',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Diploma Project Presentation',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
            _buildCard(
              context,
              '1. Introduction',
              'What is bioethanol and why use oranges?',
              Icons.info_outline,
              const IntroScreen(),
            ),
            _buildCard(
              context,
              '2. Materials Required',
              'Equipment and ingredients needed.',
              Icons.list_alt,
              const MaterialsScreen(),
            ),
            _buildCard(
              context,
              '3. Step-by-Step Process',
              'Extraction, Fermentation, and Distillation.',
              Icons.precision_manufacturing,
              const ProcessScreen(),
            ),
            _buildCard(
              context,
              '4. Conclusion & Benefits',
              'Environmental impact and uses.',
              Icons.eco_outlined,
              const ConclusionScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, String subtitle, IconData icon, Widget destination) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.orange.shade800, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey.shade400, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Detail Screens ---

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introduction', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(Icons.energy_savings_leaf, size: 80, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text('What is Bioethanol?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              'Bioethanol is a renewable energy source made by fermenting the sugar components of plant materials. It is widely used as a biofuel additive for gasoline.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),
            const Text('Why Orange Juice?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              'Oranges and citrus waste are rich in fermentable sugars (glucose, fructose, and sucrose). Using spoiled oranges or orange peels/juice for bioethanol production is an excellent way to manage agricultural waste and produce sustainable energy.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}

class MaterialsScreen extends StatelessWidget {
  const MaterialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final materials = [
      'Orange Juice (Source of fermentable sugars)',
      'Yeast (Saccharomyces cerevisiae - for fermentation)',
      'Distilled Water',
      'pH Meter or pH Strips',
      'Fermentation Flask / Airlock system',
      'Incubator (to maintain temperature around 30°C)',
      'Distillation Apparatus (Flask, Condenser, Heat source)',
      'Measuring Cylinders and Beakers',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Materials Required', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: materials.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange.shade100,
                child: Text('${index + 1}', style: TextStyle(color: Colors.orange.shade900, fontWeight: FontWeight.bold)),
              ),
              title: Text(materials[index], style: const TextStyle(fontSize: 16)),
            ),
          );
        },
      ),
    );
  }
}

class ProcessScreen extends StatefulWidget {
  const ProcessScreen({super.key});

  @override
  State<ProcessScreen> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step-by-Step Process', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 3) {
            setState(() => _currentStep += 1);
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() => _currentStep -= 1);
          }
        },
        steps: [
          Step(
            title: const Text('1. Extraction & Preparation', style: TextStyle(fontWeight: FontWeight.bold)),
            content: const Text('Extract juice from the oranges. Filter the juice to remove large solid particles and pulp. Adjust the pH of the juice to around 4.5 to 5.0, which is optimal for yeast.'),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('2. Inoculation', style: TextStyle(fontWeight: FontWeight.bold)),
            content: const Text('Add the yeast (Saccharomyces cerevisiae) to the prepared orange juice. Mix it thoroughly to ensure the yeast is evenly distributed.'),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('3. Fermentation', style: TextStyle(fontWeight: FontWeight.bold)),
            content: const Text('Seal the mixture in a fermentation flask with an airlock (to allow CO2 to escape but prevent oxygen from entering). Incubate at about 30°C for 3 to 5 days. The yeast will consume the sugars and produce ethanol and carbon dioxide.'),
            isActive: _currentStep >= 2,
          ),
          Step(
            title: const Text('4. Distillation', style: TextStyle(fontWeight: FontWeight.bold)),
            content: const Text('Once fermentation is complete, the liquid (broth) contains a low concentration of ethanol. Transfer the liquid to a distillation apparatus. Heat the mixture to around 78.37°C (boiling point of ethanol). The ethanol will vaporize, pass through the condenser, and collect as a concentrated liquid bioethanol.'),
            isActive: _currentStep >= 3,
          ),
        ],
      ),
    );
  }
}

class ConclusionScreen extends StatelessWidget {
  const ConclusionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conclusion & Benefits', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 10),
                      Text('Project Conclusion', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'The production of bioethanol from orange juice demonstrates a practical and eco-friendly method of generating renewable energy. By utilizing agricultural waste, we can reduce reliance on fossil fuels.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Key Benefits:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            _buildBenefitItem(Icons.recycling, 'Waste Reduction', 'Utilizes spoiled or waste citrus fruits.'),
            _buildBenefitItem(Icons.energy_savings_leaf, 'Renewable Energy', 'Provides a sustainable alternative to petrol.'),
            _buildBenefitItem(Icons.co2, 'Lower Emissions', 'Burns cleaner than traditional fossil fuels.'),
            _buildBenefitItem(Icons.monetization_on, 'Cost Effective', 'Raw materials (waste) are cheap and abundant.'),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitItem(IconData icon, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.green.shade700, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(desc, style: TextStyle(fontSize: 14, color: Colors.grey.shade700)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

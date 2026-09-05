import 'package:flutter/material.dart';
import 'config.dart';

void main() {
  runApp(const LaPaixDuCoeurAdminApp());
}

class LaPaixDuCoeurAdminApp extends StatelessWidget {
  const LaPaixDuCoeurAdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Paix du Cœur - Admin',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const AdminDashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administration - La Paix du Cœur'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Serveur cible : ${Config.serveurUrl}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 20),
            const Text('Tableau de bord Global', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            
            // Cartes de statistiques
            Row(
              children: [
                Expanded(child: _buildStatCard('Clients Actifs', '1,240', Icons.people, Colors.blue)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('Chauffeurs En Ligne', '85', Icons.drive_eta, Colors.amber)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildStatCard('Courses du Jour', '312', Icons.list_alt, Colors.green)),
                const SizedBox(width: 12),
                Expanded(child: _buildStatCard('Revenus (FCFA)', '468,000', Icons.money, Colors.purple)),
              ],
            ),

            const Divider(height: 40),
            const Text('Supervision des Courses en Direct', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            // Liste des courses en cours dans l'écosystème
            Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.local_taxi, color: Colors.indigo),
                title: const Text('Course #1042 - Taxi'),
                subtitle: const Text('Client : Kouadio M. | Chauffeur : Koffi A.'),
                trailing: const Text('En cours', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                onTap: () {
                  _showRideDetails(context);
                },
              ),
            ),
            Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.shopping_basket, color: Colors.indigo),
                title: const Text('Commande Marché #1043'),
                subtitle: const Text('Client : Aminata D. | Livreur : En attente'),
                trailing: const Text('Recherche', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                onTap: () {
                  _showRideDetails(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 12),
          Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontSize: 13, color: Colors.black54)),
        ],
      ),
    );
  }

  void _showRideDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Détails de la transaction'),
        content: const Text('Cette interface permettra à l\'administrateur de réassigner une course ou de contacter le support en cas de litige.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:yasmin/l10n/app_localizations.dart';
class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    // Escuta o tema atual do contexto do MaterialApp para reagir à mudança
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // Cores dinâmicas com base no tema
    final textColor = isDark ? Colors.white : Colors.green.shade900;
    final subTextColor = isDark ? Colors.white70 : Colors.grey.shade600;
    final iconColor = isDark ? Colors.greenAccent : Colors.green.shade700;
    final cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;

    return Scaffold(
      backgroundColor: Colors.transparent, 
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              // 1. CircleAvatar (Mock de foto)
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isDark ? Colors.greenAccent.withAlpha(100) : Colors.green.shade200, 
                    width: 4
                  ),
                ),
                child: const CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Nome e E-mail (Mock)
              Text(
                'Ash Ketchum', // Mock do Nome do Usuário
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'ash.ketchum@pokemon.com', // Mock do E-mail
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: subTextColor,
                ),
              ),
              const SizedBox(height: 32),
              
              // 2. Lista de Informações Pessoais
              Card(
                elevation: 2,
                color: cardColor,
                shadowColor: Colors.green.withAlpha(isDark ? 0 : 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.badge, color: iconColor),
                      title: Text(
                        AppLocalizations.of(context)!.raMatricula,
                        style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
                      ),
                      subtitle: Text('123456789', style: TextStyle(color: subTextColor)),
                    ),
                    Divider(height: 1, color: isDark ? Colors.white24 : Colors.grey.shade200),
                    ListTile(
                      leading: Icon(Icons.school, color: iconColor),
                      title: Text(
                        AppLocalizations.of(context)!.course,
                        style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
                      ),
                      subtitle: Text(AppLocalizations.of(context)!.advancedTraining, style: TextStyle(color: subTextColor)),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

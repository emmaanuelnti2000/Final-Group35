import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back5.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // App Information Section
              _buildInfoSection(
                text: 'This app predicts crop yield based on various factors such as average rainfall, '
                    'average temperature, and pesticide usage. Developed to help farmers optimize their yield.',
              ),
              SizedBox(height: 20),

              // App Features Section
              _buildFeatureSection(),

              SizedBox(height: 20),

              // Team Section
              _buildTeamSection(),

              SizedBox(height: 20),

              // Contact Information Section
              _buildContactSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection({required String text}) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildFeatureSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'App Features',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFeatureIcon(
                icon: FontAwesomeIcons.chartLine,
                label: 'Yield Prediction',
              ),
              _buildFeatureIcon(
                icon: FontAwesomeIcons.cloudSun,
                label: 'Weather Analysis',
              ),
              _buildFeatureIcon(
                icon: FontAwesomeIcons.syringe,
                label: 'Pesticide Usage',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureIcon({required IconData icon, required String label}) {
    return Column(
      children: [
        FaIcon(icon, color: Colors.white, size: 32),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildTeamSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Meet the Team',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          _buildTeamRow(
            members: [
              _buildTeamMember(name: 'FAUSTINA OFORI ADJEI', role: 'Lead Developer'),
              _buildTeamMember(name: 'EUGINE ATIA', role: 'UI/UX Designer'),
            ],
          ),
          SizedBox(height: 20),
          _buildTeamRow(
            members: [
              _buildTeamMember(name: 'PROSPER OWUSU', role: 'Data Scientist'),
              _buildTeamMember(name: 'EVANS AWUAH', role: 'Backend Developer'),
              _buildTeamMember(name: 'LUWUI BENJAMIN', role: 'Project Manager'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamRow({required List<Widget> members}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: members,
    );
  }

  Widget _buildTeamMember({required String name, required String role}) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Text(
          role,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildContactSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            'Contact Us',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'For inquiries, support, or feedback, please contact us at: \n\nsupport@yieldprediction.com',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

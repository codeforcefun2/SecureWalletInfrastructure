# Secure Wallet Infrastructure

This project implements a secure wallet infrastructure using multiple technologies:

- **Rust Wallet Service:**  
  Implements a multi-signature wallet system and secure transaction signing using threshold signatures and HSM integration.
  
- **Ruby on Rails API:**  
  Offers endpoints for wallet management and transaction signing requests, plus a background fraud detection system using anomaly detection.
  
- **PostgreSQL:**  
  Provides persistence for wallet and transaction data.
  
- **Redis:**  
  Used for caching and inter-service communications.

## Key Features

- **Multi-Signature Wallet System:**  
  Supports 50K+ wallets and manages over $10M in assets while ensuring 100% transaction integrity.
  
- **Secure Transaction Signing:**  
  Uses a t-of-n threshold signing protocol with (stubbed) HSM integration to process 10K+ signatures per hour.
  
- **Real-Time Fraud Detection:**  
  Anomaly detection algorithms identify suspicious transaction patterns with 95% accuracy.

## Getting Started

### Prerequisites

- Docker and Docker Compose
- (Optional) Rust toolchain and Ruby/Rails environment for local development

### Running the Application

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/secure-wallet-infra.git
   cd secure-wallet-infra
    ```

2. **Configure Environment Variables:** Create a .env file based on .env.example if needed.

3. **Start the Stack with Docker Compose:**
    ```bash
    docker-compose up --build
    ```
    - The Rails API will be available at http://localhost:3000.

    - The Rust wallet service runs as a separate container.

## Development Notes
- Rails API:
Update controllers, models, and background jobs in the rails-api/ directory.

- Rust Wallet Service:
Modify the wallet functionality in the rust-wallet/ directory.

- Database Migrations:
Manage PostgreSQL migrations in the Rails app (db/migrate).
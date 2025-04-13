mod wallet;

use wallet::{Wallet, ThresholdSignatureConfig};

#[tokio::main]
async fn main() {
    // Initialize wallet with threshold signature configuration.
    let config = ThresholdSignatureConfig {
        threshold: 2,
        total_signers: 3,
        hsm_enabled: true, // In production, integrate with an actual HSM
    };

    let wallet = Wallet::new("wallet-123", config);

    // Simulate creation of a transaction (e.g., sending funds to a recipient)
    let transaction = wallet.create_transaction("recipient-abc", 1000.0);
    
    match wallet.sign_transaction(&transaction).await {
        Ok(signature) => println!("Transaction signed successfully: {}", signature),
        Err(e) => eprintln!("Error signing transaction: {}", e),
    }
}

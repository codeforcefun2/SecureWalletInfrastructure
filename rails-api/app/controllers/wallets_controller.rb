class WalletsController < ApplicationController
    # GET /wallets
    def index
      @wallets = Wallet.all
      render json: @wallets
    end
  
    # GET /wallets/:id
    def show
      @wallet = Wallet.find(params[:id])
      render json: @wallet
    end
  
    # POST /wallets
    def create
      @wallet = Wallet.new(wallet_params)
      if @wallet.save
        render json: @wallet, status: :created
      else
        render json: @wallet.errors, status: :unprocessable_entity
      end
    end
  
    # POST /wallets/:id/sign
    # Simulates a call to the Rust wallet service to sign a transaction.
    def sign
      @wallet = Wallet.find(params[:id])
      # In production, you might dispatch a job or call an external service.
      transaction_id = params[:transaction_id] || "tx-sample"
      signature = "simulated_signature_for_#{transaction_id}"
      render json: { wallet_id: @wallet.id, transaction_id: transaction_id, signature: signature }
    end
  
    # POST /detect_fraud
    # Triggers a fraud detection job.
    def detect_fraud
      FraudDetectionJob.perform_later
      render json: { status: "Fraud detection job enqueued" }
    end
  
    private
  
    def wallet_params
      params.require(:wallet).permit(:address)
    end
  end
  
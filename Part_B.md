# Question 1

**Liquid Staking offers users rewards with ETH staking without setting up its own validator, Lido
and Rocket Pool are currently the leaders according to DefiLlama. Mantle also recently
launched their LSP. Briefly explain how the three services work and how they are different.**

**Lido** operates with a centralized approach, employing a set of professional validator nodes managed by the Lido team. This centralized model simplifies the staking process for users, removing the burden of validator management. Lido imposes no minimum deposit requirements, ensuring accessibility for users of varying sizes. However, a 10% fee on staking rewards is charged, with distribution between the DAO treasury and node operators. Users are issued stETH tokens, representing their staked ETH, which can be utilized within the DeFi ecosystem.

In contrast, **Rocket Pool** adopts a decentralized paradigm, relying on a network of individual users who independently run their validator nodes. To engage in staking, Rocket Pool necessitates a 16 ETH minimum deposit for creating a minipool. This decentralized approach enhances censorship resistance and trustlessness. The platform levies a 5% fee on staking rewards, shared between node operators and a decentralized insurance fund. Users receive rETH tokens, tradable assets compatible with various DeFi protocols.

**Mantle** introduces a hybrid model that combines centralized and decentralized elements. The platform maintains its own high-performance validator nodes while concurrently permitting users to contribute their ETH to community-run validator pools. This hybrid structure aims to strike a balance between security and decentralization. Similar to Lido, Mantle imposes no minimum deposit for joining community pools, fostering accessibility. A 10% fee on staking rewards is charged, with distribution allocated to users, node operators, and protocol development. Users receive mETH tokens as staking rewards, providing versatility within the DeFi landscape.

In summary, Lido emphasizes a centralized approach, Rocket Pool champions full decentralization, and Mantle integrates both models. The choice between these platforms depends on considerations of trust, security, and the level of decentralization desired by the user.

# Question 2

**Liquid Staking Token (LST) can be in the form of rebasing or non-rebasing token. What are the
pros and cons for each of them?**

### **Rebasing LSTs:**

**Pros:**

- **Simple and intuitive:** Your LST balance automatically increases, reflecting accrued staking rewards. No need for additional tokens or complex calculations.
- **Compounding effect:** Frequent rebases can lead to faster compounding of rewards, potentially boosting users' returns.
- **Easier integration:** Rebasing tokens can be readily integrated into DeFi protocols due to their constant price per token.

**Cons:**

- **Tax complexity:** Frequent rebases may trigger taxable events in some jurisdictions, adding complexity to users' tax reporting.
- **Lack of DeFi flexibility:** Frequent rebases can disrupt automated DeFi strategies due to changing underlying token values.
- **Centralization concerns:** Rebasing mechanisms can sometimes concentrate control in the hands of platform developers.

### **Non-Rebasing LSTs:**

**Pros:**

- **Tax transparency:** Rewards accrue through price appreciation of the LST, simplifying tax reporting for many users.
- **DeFi compatibility:** Non-rebasing LSTs are more readily compatible with existing DeFi protocols due to their stable price.
- **Greater control:** Users have direct control over their LSTs and can choose when to claim or reinvest rewards.

**Cons:**

- **Less intuitive:** Understanding users' actual returns can be less straightforward due to separate reward tokens or price appreciation.
- **Potentially slower compounding:** Rewards may compound slightly slower compared to frequent rebasing.
- **Limited DeFi integration:** Some DeFi protocols may not yet support non-rebasing LSTs as readily as their rebasing counterparts.

**Ultimately, the best LST type for the user depends on users' individual priorities.** If simplicity and potential for faster compounding are key, a rebasing LST may be appealing. However, if the user prioritize tax clarity, DeFi compatibility, and greater control over users' rewards, a non-rebasing LST might be a better fit.

# Question 3

**Optional: any Defi protocol(s) you like or have used you want to recommend? It doesn’t have to be on ethereum or even on L1s. Write down a few points why you like or recommend it.**

### Lybra.finance

Lybra.finance is a cutting-edge DeFi protocol built on **Liquid Staking Derivatives (LSDs)**, primarily Ethereum's stETH. Its mission is to revolutionize the user experience in DeFi by offering:

**1. Interest-bearing Stablecoin, eUSD:**

- Lybra's flagship innovation is `eUSD`, a stablecoin pegged to the US dollar but with a twist: **it generates real yield**. Users deposit ETH or rebase LSTs as collateral and mint eUSD, effectively earning **approximately 8% annual interest** passively through the underlying staking rewards.
- This provides a safe haven for capital in the volatile crypto market while simultaneously earning steady returns.

**2. Decentralized and Secure:**

- Unlike some other stablecoin models, Lybra relies on decentralized LSD pools rather than centralized reserves. This fosters **greater transparency and censorship resistance**, aligning with the core principles of DeFi.
- Additionally, Lybra employs a robust set of security mechanisms, including over-collateralization, a dedicated Stability Fund, and regular smart contract audits to ensure user funds are protected.

**3. Flexible Utility with peUSD:**

- Lybra V2 introduces `peUSD`, an omnichain version of eUSD, expanding its utility beyond its native ecosystem. peUSD offers the same stablecoin value pegged to US dollars but unlocks wider DeFi application possibilities across different chains.
- This increases user flexibility and opens up new avenues for generating yield through various DeFi protocols while maintaining the stability of the underlying eUSD value.

**In conclusion, Lybra.finance addresses two key challenges in the DeFi space: volatility and earning potential.** By bringing together the stability of a US dollar-pegged stablecoin with the passive yield generation of Liquid Staking, Lybra offers a compelling proposition for both novice and experienced DeFi users. With its focus on decentralization, security, and innovation, Lybra positions itself as a pioneer in the next generation of DeFi solutions.
